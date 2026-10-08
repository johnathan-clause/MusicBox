_addon.name     = 'Music Box'
_addon.description = 'A fork of the Windower 4 addon \'BattleStations\' that allows the user to change or remove not just the battle music, but all of the music in Final Fantasy 11 Online!'
_addon.orignal_author   = 'Sjshovan (Apogee) sjshovan@gmail.com'
_addon.author = 'daywalker'
_addon.original_version  = '0.9.1'
_addon.version = '1.1.0'
_addon.commands = {'musicbox', 'mb'}

local _logger = require('logger')
local _config  = require('config')
local _packets = require('packets')
local _res = require('resources')

local _defaultsPath = 'data/defaults.xml'

require('functions')
require('constants')
require('helpers')

local hasZoned = false
local tryMount = false

local defaults = _config.load(_defaultsPath, 
{
    stations = 
    {
        day = 108.02,
        night=  108.02,
        solo = 108.06,
        party = 108.06,
        mount = 108.05
    }
})

local shuffle = 
{
    zone = 
    {
        seed = 0,
        tables = {},
        keys = {},
        last = 0
    },
    battle = 
    {
        seed = 0,
        tables = {},
        keys = {}, 
        last = 0
    },
    mount = 
    {
        seed = 0,
        tables = {},
        keys = {}, 
        last = 0
    }
}

local music_types = 
{ 
    ['solo'] = music.types.battle_solo, 
    ['party'] = music.types.battle_party, 
    ['day'] = music.types.idle_day, 
    ['night'] = music.types.idle_night, 
    ['mount'] = music.types.mount 
}

local help = {
    commands = {
        buildHelpSeperator('=', 28),
        buildHelpTitle('Commands'),
        buildHelpSeperator('=', 28),
        buildHelpCommandEntry('list [radios|stations] [category#]', 'Display the available radios and or stations.'),
        buildHelpCommandEntry('set <station> [radio]', 'Set radio(s) to the given station (per zone).'),
        buildHelpCommandEntry('setglobal <station> [radio]', 'Set radio(s) to the given station.'),
        buildHelpCommandEntry('savedefaults', 'Overwrites current settings file with the current character settings.'),
        buildHelpCommandEntry('get [radio]', 'Display currently set station on the given radio(s).'),
        buildHelpCommandEntry('default [radio]', 'Set radio(s) to the default station (Current Zone Music).'),
        buildHelpCommandEntry('normal [radio]', 'Set radio(s) to the original game music.'),
        buildHelpCommandEntry('reload', 'Reload Music Box.'),
        buildHelpCommandEntry('about', 'Display information about Music Box.'),
        buildHelpCommandEntry('help', 'Display Music Box commands.'),
        buildHelpSeperator('=', 28),
    },

    radios = {
        buildHelpSeperator('=', 25),
        buildHelpTitle('Radios'),
        buildHelpSeperator('=', 25),
        buildHelpRadioEntry(stations.receivers.solo:ucfirst(), 'Plays Solo Battle Music'),
        buildHelpRadioEntry(stations.receivers.party:ucfirst(), 'Plays Party Battle Music'),
        buildHelpRadioEntry(stations.receivers.day:ucfirst(), 'Plays Daytime Zone Music'),
        buildHelpRadioEntry(stations.receivers.night:ucfirst(), 'Plays Nighttime Zone Music'),
        buildHelpRadioEntry(stations.receivers.mount:ucfirst(), 'Plays Mount Music'),
        buildHelpSeperator('=', 25),
    },
    
     about = {
        buildHelpSeperator('=', 23),
        buildHelpTitle('About'),
        buildHelpSeperator('=', 23),
        buildHelpTypeEntry('Name', _addon.name),
        buildHelpTypeEntry('Description', _addon.description),
        buildHelpTypeEntry('Author', _addon.author),
        buildHelpTypeEntry('Version', _addon.version),
        buildHelpSeperator('=', 23),
    },
    
    aliases = {
        list = {
            stations = T{
                's', 
                'station',
                'stations',
            },
            radios = T{
                'r',
                'radio', 
                'radios',
                'receiver',
                'receivers'
            },
            categories = T{
                'c',
                'cat',
                'category',
                'categories'
            },
            all = T{
                '*',
                'a',
                'all',
            }
        } 
    }
}

local settings = _config.load(T(defaults))

function displayHelp(table_help)
    for index, command in pairs(table_help) do
        displayResponse(command)
    end
end

function displayStations(range)
    displayResponse(buildHelpSeperator('=', 27))
    displayResponse(buildHelpTitle('Stations'))
    displayResponse(buildHelpSeperator('=', 27))
    
    if range ~= nil then 
        if categoryValid(range) then
            displayRangeFrequencies(range)
        end
    else
        for i=100, 108, 1 do
            range = tostring(i)
            displayRangeFrequencies(range)
       end
    end
    displayResponse(buildHelpSeperator('=', 26))    
end

function displayRangeFrequencies(range, name)
    local categories = stations.categories
    
    if categoryValid(range) then
        local name = categories[range]
        displayResponse(buildHelpStationCategoryEntry(range, name))
        displayFrequencies(range)
    end
end

function displayFrequencies(range)
    local r = tonumber(range)
    local t = {}

    for k,v in pairs(stations.frequencies) do
        if tonumber(k) < r + 1 and tonumber(k) > r - 1 then
            table.insert(t, k)
        end
    end

    table.sort(t)

    for i=1, #t, 1 do
        local frequency = tostring(r + i / 100)
        if frequencyValid(tonumber(frequency)) then 
            local frequencyObj = getFrequencyObj(frequency)
            local response = buildHelpStationEntry(frequency, frequencyObj.callSign)
            displayResponse(response)
        end
    end
end

function displayCategories()
    displayResponse(buildHelpSeperator('=', 27))
    displayResponse(buildHelpTitle('Categories'))
    displayResponse(buildHelpSeperator('=', 27))
    for i=100, 108, 1 do
        local range = tostring(i)
        if categoryValid(range) then
            local name = stations.categories[range]
            displayResponse(buildHelpStationCategoryEntry(range, name))
        end
    end
    displayResponse(buildHelpSeperator('=', 27))  
end 

function getStations()
    return settings.stations
end

function setStation(radio, frequency, ...)
    local args = ...
    local zone_id = tostring(windower.ffxi.get_info().zone)
    local totd = getTOTD()
    if not args then
        if settings.stations[zone_id] then
            settings.stations[zone_id][radio] = frequency
        else
            settings.stations[zone_id] = { [radio] = frequency }
            if radio == 'day' and not settings.stations[zone_id]['night'] then
                settings.stations[zone_id]['night'] = frequency
            end
            if radio == 'night' and not settings.stations[zone_id]['day'] then
                settings.stations[zone_id]['day'] = frequency
            end
        end
    else
        settings.stations[radio] = frequency
    end
    settings:save()
end

function resolveCurrentStations()
    local current_stations = getStations()
    local radio = 'solo'
    local frequency = tostring(defaults.stations.solo)
    local zone_id = tostring(windower.ffxi.get_info().zone)
    local message_template = '%s station found in settings was not valid and was set to the default %s (%s).'

    for k,v in pairs(current_stations) do
        local s = tostring(k)
        local f = tostring(v)
        
        if s == zone_id then

            for r,station in pairs(current_stations[s]) do 

                if stations.receivers[current_stations] then
                    if not frequencyValid(station) then
                        radio = r
                        frequency = tostring(defaults.stations[r])
                        current_stations[s][r] = defaults.stations[r]
                        
                        setStation(radio, frequency)

                        displayResponse(
                            buildWarningMessage(
                                message_template:format(
                                    '%s.%s':format(s, r):color(colors.secondary),
                                    frequency:color(colors.primary), 
                                    getFrequencyObj(frequency).callSign
                                )
                            )
                        )
                    end
                end 
            end
        else
            if stations.receivers[s] then 
                if not frequencyValid(f) then
                    radio = s
                    frequency = tostring(defaults.stations[s])
                    current_stations[s] = defaults.stations[s]
                    
                    setStation(radio, frequency, true)
                    
                    displayResponse(
                        buildWarningMessage(
                            message_template:format(
                                radio:ucfirst():color(colors.secondary),
                                frequency:color(colors.primary), 
                                getFrequencyObj(frequency).callSign
                            )
                        )
                    )
                end
            end
        end
    end
    
    return current_stations
end

function injectMusicPacket(radio, ...)
    local zone_id = tostring(windower.ffxi.get_info().zone)
    local station = resolveCurrentStations()[radio]
    local song = 0

    if settings.stations[zone_id] then 
        local c, r, f = getConditionalObj(...)
        if settings.stations[zone_id][r] then
            song = getConditionalSongTranslation(getFrequencyObj(f).song, r, f, ...)

            getResponse(r, f, ...)

            if r == stations.receivers.mount and shuffle[c].last ~= song then shuffle[c].last = song end

            _packets.inject(_packets.new('incoming', packets.inbound.music_change.id, 
            {
                ['BGM Type'] = music_types[r],
                ['Song ID'] = song
            }))
        end
    else
        song = getConditionalSongTranslation(getFrequencyObj(station).song, radio, station, ...)
        getResponse(radio, station, ...)
        _packets.inject(_packets.new('incoming', packets.inbound.music_change.id, {
        ['BGM Type'] = music_types[radio],
        ['Song ID'] = song
        }))
    end
end

function getFrequencyObj(frequency)
    return stations.frequencies[tostring(frequency)]
end

function getFrequencyObjBySong(song)
    for k,v in pairs(stations.frequencies) do
        if v.song == song then return v, k end
    end
end

function getTOTD()
    local totd = ''
    if timeIsDaytime() then
        totd = stations.receivers.day
    else
        totd = stations.receivers.night
    end
    return totd
end

function getCurrentTime(formatted)
    local timestamp = tostring(windower.ffxi.get_info().time)
    local hours = (timestamp / 60):floor()
    local minutes = timestamp % 60
    if formatted then 
        return "%s:%s":format(hours, minutes)
    end
    return timestamp
end

function getZoneBGMTable() 
    local data = windower.packets.last_incoming(packets.inbound.zone_update.id)
    local packet = _packets.parse('incoming', data)
    return {
        day = packet['Day Music'],
        night = packet['Night Music'],
        solo = packet['Solo Combat Music'],
        party = packet['Party Combat Music'],
        mount = packet['Mount Music']
    }
end

function getMusicTable()
    local t = 
    {
        solo    = 9999,
        party   = 9999,
        day     = 9999,
        night   = 9999,
        mount   = 9999
    }
    local zone_id = tostring(windower.ffxi.get_info().zone)
    local current_stations = resolveCurrentStations()
    local song = 0

    if current_stations[zone_id] then
        local station = current_stations[zone_id]
        
        for r, f in pairs(station) do 
            song = getFrequencyObj(f).song
            song = getConditionalSongTranslation(song, r, f)
            t[r] = song
        end
    else
        for r, f in pairs(current_stations) do 
            if type(f) == type(0) then
                song = getFrequencyObj(f).song
                song = getConditionalSongTranslation(song, r, f)
                t[r] = song
            end
        end
    end

    return t
end

function getRandomSongByType(music_type)
    local t = {}

    for k, v in pairs(stations.frequencies) do
        if v.musicType == music_type then
            table.insert(t, v)
        end
    end

    return t
end

function getRandomMusicTables()
    local random_music_table = 
    {
        ['zone'] = getRandomSongByType('zone'),
        ['battle'] = getRandomSongByType('battle'),
        ['mount'] = getRandomSongByType('mount')
    }
    return random_music_table
end

function getRandomSongKeys()
    local random_song_keys = 
    {
        ['solo'] = math.random(#getRandomMusicTables()['battle']),
        ['party'] = math.random(#getRandomMusicTables()['battle']),
        ['day'] = math.random(#getRandomMusicTables()['zone']),
        ['night'] = math.random(#getRandomMusicTables()['zone']),
        ['mount'] = math.random(#getRandomMusicTables()['mount']),
    }

    return random_song_keys
end

function getConditionalSong(radio, station)
    local zone_bgm_table = getZoneBGMTable()
    local zone_id = tostring(windower.ffxi.get_info().zone)
    local zone_stations = settings.stations[zone_id]
    local totd = getTOTD()

    local radio_conditional_table = 
    {
        ['solo'] = 
        {
            ['108.02'] = zone_bgm_table.solo,
            ['108.03'] = (zone_stations and zone_stations[totd]) and getFrequencyObj(zone_stations[totd]).song or (settings.stations[totd] and getFrequencyObj(settings.stations[totd]).song or zone_bgm_table[totd]),
            ['108.04'] = (zone_stations and zone_stations.mount) and getFrequencyObj(zone_stations.mount).song or (settings.stations.mount and getFrequencyObj(settings.stations.mount).song or zone_bgm_table.mount),
            ['108.05'] = (zone_stations and zone_stations.mount) and getFrequencyObj(zone_stations.mount).song or (settings.stations.mount and getFrequencyObj(settings.stations.mount).song or zone_bgm_table.mount),
            ['108.06'] = shuffle['battle'].tables['battle'][shuffle['battle'].keys['solo']].song,
        },
        ['party'] = 
        {
            ['108.02'] = zone_bgm_table.party,
            ['108.03'] = (zone_stations and zone_stations[totd]) and getFrequencyObj(zone_stations[totd]).song or (settings.stations[totd] and getFrequencyObj(settings.stations[totd]).song or zone_bgm_table[totd]),
            ['108.04'] = (zone_stations and zone_stations.mount) and getFrequencyObj(zone_stations.mount).song or (settings.stations.mount and getFrequencyObj(settings.stations.mount).song or zone_bgm_table.mount),
            ['108.05'] = (zone_stations and zone_stations.mount) and getFrequencyObj(zone_stations.mount).song or (settings.stations.mount and getFrequencyObj(settings.stations.mount).song or zone_bgm_table.mount),
            ['108.06'] = shuffle['battle'].tables['battle'][shuffle['battle'].keys['party']].song,
        },
        ['day'] = 
        {
            ['108.02'] = zone_bgm_table.day,
            ['108.03'] = (zone_stations and zone_stations[totd]) and getFrequencyObj(zone_stations.day).song or (settings.stations.day and getFrequencyObj(settings.stations.day).song or zone_bgm_table.day),
            ['108.04'] = (zone_stations and zone_stations.mount) and getFrequencyObj(zone_stations.mount).song or (settings.stations.mount and getFrequencyObj(settings.stations.mount).song or zone_bgm_table.mount),
            ['108.05'] = (zone_stations and zone_stations.mount) and getFrequencyObj(zone_stations.mount).song or (settings.stations.mount and getFrequencyObj(settings.stations.mount).song or zone_bgm_table.mount),
            ['108.06'] = shuffle['zone'].tables['zone'][shuffle['zone'].keys['day']].song,
        },
        ['night'] = 
        {
            ['108.02'] = zone_bgm_table.night,
            ['108.03'] = (zone_stations and zone_stations[totd]) and getFrequencyObj(zone_stations.night).song or (settings.stations.night and getFrequencyObj(settings.stations.night).song or zone_bgm_table.night),
            ['108.04'] = (zone_stations and zone_stations.mount) and getFrequencyObj(zone_stations.mount).song or (settings.stations.mount and getFrequencyObj(settings.stations.mount).song or zone_bgm_table.mount),
            ['108.05'] = (zone_stations and zone_stations.mount) and getFrequencyObj(zone_stations.mount).song or (settings.stations.mount and getFrequencyObj(settings.stations.mount).song or zone_bgm_table.mount),
            ['108.06'] = shuffle['zone'].tables['zone'][shuffle['zone'].keys['night']].song,
        },
        ['mount'] = 
        {
            ['108.02'] = zone_bgm_table.mount,
            ['108.03'] = (zone_stations and zone_stations[totd]) and getFrequencyObj(zone_stations[totd]).song or (settings.stations[totd] and getFrequencyObj(settings.stations[totd]).song or zone_bgm_table[totd]),
            ['108.04'] = (zone_stations and zone_stations.mount) and getFrequencyObj(zone_stations.mount).song or (settings.stations.mount and getFrequencyObj(settings.stations.mount).song or zone_bgm_table.mount),
            ['108.05'] = (zone_stations and zone_stations.mount) and getFrequencyObj(zone_stations.mount).song or (settings.stations.mount and getFrequencyObj(settings.stations.mount).song or zone_bgm_table.mount),
            ['108.06'] = shuffle['mount'].tables['mount'][shuffle['mount'].keys['mount']].song,
        },
    }
    return radio_conditional_table[tostring(radio)][tostring(station)]
end

function getConditionalObj(...)
    local arg_table = 
    {
        ['mount'] = false,
        ['party'] = false,
        ['solo'] = false,
        ['day'] = false,
        ['night'] = false
    }
    local args = getArgs(... or arg_table, arg_table)
    local c = ''
    local r = ''
    local f = ''
    local zone_id = tostring(windower.ffxi.get_info().zone)
    local zone_bgm_table = getZoneBGMTable()
    local has_args = hasArgs(args, arg_table)
    local totd = getTOTD()
    local station = {}

    if settings.stations[zone_id] then
        station = settings.stations[zone_id]
    else
        station = settings.stations
    end

    if (playerIsMounted() and not has_args) or args['mount'] then
        c = 'mount'
        r = 'mount'
    end
    if(totd == stations.receivers.day and playerHasZoned() and not has_args) or args['day'] then
        c = 'zone'
        r = 'day'
    end
    if (totd == stations.receivers.night and playerHasZoned() and not has_args) or args['night'] then
        c = 'zone'
        r = 'night'
    end
    if (playerInParty() and playerIsFighting() and not has_args) or args['party'] then
        c = 'battle'
        r = 'party'
    end
    if (playerIsFighting() and not has_args) or args['solo'] then
        c = 'battle'
        r = 'solo'
    end

    if c == '' or r == '' then
        return false
    end 

    f = tostring(station[r])

    return c, r, f
end

function getConditionalResponse(...)
    local c, r, f = getConditionalObj(...)
    
    if not c then return false end

    local zone_bgm_table = getZoneBGMTable()
    
    local response_table = 
    {
        ['108.01'] = 0,
        ['108.02'] = zone_bgm_table[r],
        ['108.03'] = stations.frequencies['108.03'].song,
        ['108.04'] = stations.frequencies['108.04'].song,
        ['108.05'] = stations.frequencies['108.05'].song,
        ['108.06'] = shuffle[c].tables[c][shuffle[c].keys[r]].song,
    }
    if not response_table[f] then return false end
    local obj, station = getFrequencyObjBySong(response_table[f])

    local response_message = buildSetResponseMessage(
                                r:ucfirst(), 
                                'radio', 
                                f, 
                                '%s %s':format(obj.callSign:color(colors.secondary), tostring(station):color(colors.primary))
                            )..'.'
    return response_message
end

function getConditionalSongTranslation(song, radio, station, ...)
    if 
        song ~= music.songs.system.zone and
        song ~= music.songs.system.normal and
        song ~= music.songs.system.mount and
        song ~= music.songs.system.chocobo and
        song ~= music.songs.system.shuffle 
    then
        return song
    end
    
    return getConditionalSong(radio, station)
end

function getPlayerBuffs()
    return T(windower.ffxi.get_player().buffs)
end

function timeIsDaytime()
    local current_time = tonumber(getCurrentTime())
    return current_time >= 6*60 and current_time <= 18*60
end

function playerIsFighting()
    return windower.ffxi.get_player().status == player.statuses.fighting
end

function playerInParty() 
    local party_size = windower.ffxi.get_party().alliance_count
    return party_size and party_size > 1
end

-- TODO: reimplement logic for this
function playerInReive()
    return getPlayerBuffs():contains(player.buffs.reiveMark)
end

function playerIsMounted()
    local _player = windower.ffxi.get_player()
    
    if _player then
        return _player.status == player.statuses.mounted or 
               _player.status == player.statuses.chocobo or
               getPlayerBuffs():contains(player.buffs.mounted)
    end
    
    return false
end

-- TODO: find a more reliable way of keeping track of zoning
function playerHasZoned(updateZoned)
    if updateZoned == 0 then
        hasZoned = false
    elseif updateZoned == 1 then
        hasZoned = true
    end
        
    return hasZoned
end

function frequencyValid(frequency)
    return stations.frequencies[tostring(frequency)] ~= nil
end

function radioValid(radio)
    return stations.receivers[radio] ~= nil or radio == '*'
end

function categoryValid(category) 
    return stations.categories[category] ~= nil
end

function listTypeValid(list_type) 
    return help.lists[list_type] ~= nil
end

function printTable(table)
    for k,v in pairs(table) do
        print('k: %s v: %s':format(tostring(k), tostring(v)))
    end
end
function getArgs(args, arg_table)
    local t = arg_table
    for k,v in pairs(args) do
        t[k] = v
    end
    return t
end

function hasArgs(args, arg_table)
    local t = arg_table
    for k,v in pairs(args) do
        if t[k] then return true end
    end
    return false
end

function getResponse(radio, frequency, ...)
    local r = radio or 'solo'
    frequency = frequency or '108.02'
    local respond = getConditionalResponse(...)
    local response_message = buildSetResponseMessage(
                                r:ucfirst(), 
                                'radio', 
                                frequency, 
                                getFrequencyObj(frequency).callSign:color(colors.secondary)
                            )..'.'

    if respond then
        response_message = getConditionalResponse(...)
    end

    displayResponse(
        buildCommandResponse(response_message, true)
    )
end

function initShuffle()
    local time = os.time() - os.clock() * 1000
    math.randomseed(time)
    local tables = getRandomMusicTables()
    local keys = getRandomSongKeys()
    shuffle = 
    {
        zone = 
        {
            seed = time,
            tables = tables,
            keys = keys
        },
        battle = 
        {
            seed = time,
            tables = tables,
            keys = keys
        },
        mount = 
        {
            seed = time,
            tables = tables,
            keys = keys
        }
    }
end

function updateShuffle(...)
    local c, r, f = getConditionalObj(...)

    if c then 
        local seed = os.time() - os.clock() * 1000
        math.randomseed(seed)
        local tables = getRandomMusicTables()
        local keys = getRandomSongKeys()

        shuffle[c].seed = seed
        shuffle[c].tables = tables
        shuffle[c].keys = keys
    end
end

function tryLoad()
    playerHasZoned(1)
    local cond_args = {}
    if playerIsMounted() then cond_args = {['mount'] = true} end
    requestInject()
    handleInjectionNeeds(cond_args)
end

function requestInject() 
    needs_inject = true
end

function tryInject(...)
    updateShuffle(...)
    requestInject()
    handleInjectionNeeds(...)
end

function handleInjectionNeeds(...) 
    local c, r, f = getConditionalObj(...)
    local zone_id = tostring(windower.ffxi.get_info().zone)

    if needs_inject and settings.stations[zone_id] then
        injectMusicPacket(zone_id, ...)
        needs_inject = false
    end
    
    if needs_inject and c then    
        for k,v in pairs(settings.stations) do 
            if r == k then injectMusicPacket(k, ...) end
        end
        needs_inject = false
    end

    playerHasZoned(0) 
end

windower.register_event('load', 'login', function() 
    initShuffle()
    if windower.ffxi.get_player() ~= nil then
        tryLoad()
    end
end)

windower.register_event('unload', function() 
    local zone_bgm_table = getZoneBGMTable()

    for r in pairs(stations.receivers) do 
        _packets.inject(_packets.new('incoming', packets.inbound.music_change.id, {
            ['BGM Type'] = music_types[r],
            ['Song ID'] = zone_bgm_table[r],
        }))
    end
end)

windower.register_event('action', function(act)
    if act.actor_id == windower.ffxi.get_player().id then
        if act.category == 4 and act.recast == 225 and act.targets[1].actions[1].animation == 939 then
            if not playerInParty() then
                functions.loop(tryInject, 1, 5)          
            end    
        end
    end
end)

-- TODO: find a more reliable way of keeping track of zoning
windower.register_event('gain buff', function(id) 
    if id == player.buffs.mounted then 
        if playerHasZoned() then return end
        
        tryInject({['mount'] = true})
        tryMount = true
    end
end)

windower.register_event('outgoing chunk', function(id, data)   
    if not data then return end
    if id == packets.outbound.action.id then
        local packet = _packets.parse('outgoing', data)

        if packet.Category == packets.outbound.action.categories.engage then
            local args = {} 
            if playerInParty() then 
                args = {['party'] = true} 
            else
                args = {['solo'] = true}
            end
            tryInject(args)
        end
    end
end) 

windower.register_event('incoming chunk', function(id, data) 
    if not data then return end
    if id == packets.inbound.music_change.id then
        local packet = _packets.parse('incoming', data)
        if packet['BGM Type'] == music.types.mount and tryMount then
            local music_table = getMusicTable()
            packet['Song ID'] = music_table.mount

            tryMount = false
            shuffle.mount.last = music_table.mount
            return _packets.build(packet)
        end 
    end
end)

windower.register_event('incoming chunk', function(id, data) 
    if not data then return end
    if id == packets.inbound.zone_update.id then
        local packet = _packets.parse('incoming', data)

        if windower.ffxi.get_player().id == packet.Player then
            playerHasZoned(1)
            local totd = getTOTD()
            local cond_args = {}
            local music_table = getMusicTable()
            local zone_id = tostring(windower.ffxi.get_info().zone)

            if playerIsMounted() then
                updateShuffle({[totd] = true})
                music_table = getMusicTable()
                if shuffle.mount.last ~= music_table.mount then
                    shuffle.mount.last = music_table.mount
                    local obj, f = getFrequencyObjBySong(music_table.mount)

                    getResponse('mount', f, {['mount'] = true})
                end
            else
                cond_args = {[totd] = true}
                updateShuffle(cond_args)
                music_table = getMusicTable()
                
                if shuffle.zone.last ~= music_table[totd] then
                    shuffle.zone.last = music_table[totd]
                    local obj, f = getFrequencyObjBySong(music_table[totd])
                    
                    getResponse(totd, f, cond_args)
                end
            end
            
            packet['Solo Combat Music'] = music_table.solo
            packet['Party Combat Music'] = music_table.party
            packet['Day Music'] = music_table.day
            packet['Night Music'] = music_table.night
            packet['Mount Music'] = music_table.mount

            playerHasZoned(0)
            return _packets.build(packet)
        end
    end
end)

windower.register_event('addon command', function(command, ...)

    if command then
        command = command:lower()
    else 
        displayHelp(help.commands)
        return
    end

    local command_args = {...}
    local cond_args = {}
    local respond = false
    local response_message = ''
    local success = true
    local zone_id = tostring(windower.ffxi.get_info().zone)
    local radio = ''
    local frequency = ''

    if command == 'list' or command == 'l' then

        local list_type = command_args[1] and command_args[1]:lower() or nil
        local category = command_args[2]
        
        if help.aliases.list.stations:contains(list_type) then
            if category then
                if categoryValid(category) then
                    displayStations(category)
                else
                   respond = true
                   success = false
                   response_message = 'Category not recognized.'
                end
            else 
                displayStations()
            end       
        elseif help.aliases.list.radios:contains(list_type) then 
            displayHelp(help.radios)
        elseif help.aliases.list.categories:contains(list_type) then
            displayCategories()
        elseif help.aliases.list.all:contains(list_type) then
            displayHelp(help.radios)
            displayStations()
        else 
            respond = true
            success = false
            response_message = 'List type not recognized.'
        end    

    elseif command == 'set' or command == 's' then

        frequency = command_args[1] and command_args[1]:lower() or nil
        radio = command_args[2] and command_args[2]:lower() or nil
        
        if not frequencyValid(frequency) then
            respond = true
            success = false
            response_message = 'Frequency not recognized.'
        elseif not radioValid(radio) then
            respond = true
            success = false
            response_message = 'Radio not recognized.'           
        else 
            needs_inject = true

            setStation(radio, tonumber(frequency))
            cond_args = {[radio] = true}
            updateShuffle(cond_args)
            radio = zone_id
        end

    elseif command == 'setglobal' or command == 'sg' then

        frequency = command_args[1] and command_args[1]:lower() or nil
        radio = command_args[2] and command_args[2]:lower() or nil

        if not frequencyValid(frequency) then
            respond = true
            success = false
            response_message = 'Frequency not recognized.'
        elseif not radioValid(radio) then
            respond = true
            success = false
            response_message = 'Radio not recognized.'           
        else 
            needs_inject = true
            
            setStation(radio, tonumber(frequency), true)
            cond_args = {[radio] = true}
            updateShuffle(cond_args)
        end

    elseif command == 'savedefaults' or command == 'sd' then

        respond = true
        needs_inject = true
        response_message = 'Defaults have been updated!'
        defaults.stations = settings.stations
        _config.save(defaults, 'all')
        _config.save(settings)

    elseif command == 'get' or command == 'g' then

        local current_stations = resolveCurrentStations()
        radio = command_args[1] and command_args[1]:lower() or nil
        
        if not radioValid(radio) then
            respond = true
            success = false
            response_message = 'Radio not recognized.'
        else
            if current_stations[zone_id] and current_stations[zone_id][radio] then
                frequency = current_stations[zone_id][radio]
            else
                frequency = current_stations[radio]
            end

            getResponse(radio, frequency, {[radio] = true})
        end

    elseif command == 'default' or command == 'd' then

        needs_inject = true
        settings = defaults
        response_message = 'Settings have been reset!'

    elseif command == 'normal' or command == 'n' then

        respond = true 
        radio = command_args[1] and command_args[1]:lower() or nil
        
        if not radioValid(radio) then
            success = false
            response_message = 'Radio not recognized.'           
        else
            needs_inject = true
            frequency = '108.02'
            
            setStation(radio, tonumber(frequency))
            cond_args = {[radio] = true}
        end
        
    elseif command == 'reload' or command == 'r' then

        windower.send_command('lua r musicbox')
        
    elseif command == 'about' or command == 'a' then

        displayHelp(help.about)

    elseif command == 'help' or command == 'h' then

        displayHelp(help.commands)
             
    else

        displayHelp(help.commands)

    end

    if respond then
        displayResponse(
            buildCommandResponse(response_message, success)
        )
    end

    handleInjectionNeeds(cond_args)
end) 
