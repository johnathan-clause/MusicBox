--[[
Copyright © 2018, Sjshovan (Apogee)
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright
      notice, this list of conditions and the following disclaimer in the
      documentation and/or other materials provided with the distribution.
    * Neither the name of Battle Stations nor the
      names of its contributors may be used to endorse or promote products
      derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL Sjshovan (Apogee) BE LIABLE FOR ANY
DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
]]

packets = {
    inbound = {
        music_change = {
            id = 0x05F
        },
        zone_update = {
            id = 0x00A
        }
    },
    outbound = {
        action = {
            id = 0x01A,
            categories = {
                engage = 2,
                disengage = 4,
                mount = 0x1A,
                unmount = 0x12,
                zoning = 0x14                
             },
        }
    },
}

player = {
    statuses = {
        idle = 0x00,
        fighting = 0x01,
        mounted = 85,
        chocobo = 5
    },
    buffs = {
        reiveMark = 511,
        mounted = 252
    }
}

colors = {
    primary = 200,
    secondary = 207,
    info = 0,
    warn = 140,
    danger = 167,
    success = 158
}

music = {
    songs = {
        final_fantasy_xi = {
            a_road_once_traveled = 104,
            mhaura = 105,
            voyager = 106,
            the_kingdom_of_sandoria = 107,
            vanadiel_march = 108,
            ronfaure = 109,
            the_grand_duchy_of_jeuno = 110,
            blackout = 111,
            selbina = 112,
            sarutabaruta = 113,
            batallia_downs = 114,
            gustaberg = 116,
            rulude_gardens = 117,
            rolanberry_fields = 118,
            vanadiel_march_2 = 120,
            shadow_lord = 121,
            one_last_time_just_once_more = 122,
            hopelessness = 123,
            recollection = 124,
            mog_house = 126,
            anxiety = 127,
            airship = 128,
            tarutaru_female = 130,
            elvaan_female = 131,
            elvaan_male = 132,
            hume_male = 133,
            the_federation_of_windurst = 151,
            the_republic_of_bastok = 152,
            prelude = 153,
            metalworks = 154,
            castle_zvahl = 155,
            chateau_doraguille = 156,
            fury = 157,
            saromugue_champaign = 158,
            sorrow = 159,
            repression = 160,
            despair = 161,
            heavens_tower = 162,
            sometime_somewhere = 163,
            xarcabard = 164,
            galka = 165,
            mithra = 166,
            tarutaru_male = 167,
            hume_female = 168,
            regeneracy = 169,
            eternal_oath = 214,
            battle_theme = 101,
            battle_theme_2 = 103,
            battle_in_the_dungeon = 115,
            battle_in_the_dungeon_2 = 102,
            tough_battle = 125,            
            awakening = 119 
        },
        rise_of_the_zilart = {
            yuhtunga_jungle = 134,
            kazham = 135,
            altepa_desert = 171,
            dash_de_chocobo = 212,
            the_sanctuary_of_zitah = 190,
            bloody_promises = 194,
            to_the_heavens = 197,
            graviton = 199,
            hidden_truths = 200,
            end_theme = 201,
            moongate = 202,
            revenant_maiden = 206,
            velugannon_palace = 207,
            rabao = 208,
            norg = 209,
            tulia = 210,
            romaeve = 211,
            hall_of_the_gods = 213,
            sunbreeze_shuffle = 227,
            battle_theme_3 = 191,
            battle_in_the_dungeon_3 = 192,
            tough_battle_2 = 193,
            fighters_of_the_crystal = 196,
            ealdnarche = 198,
            belief = 195,
            buccaneers = 170
        },
        chains_of_promathia = {
            moblin_menagerie = 221,
            faded_memories = 222,
            march_of_the_hero = 223,
            words_unspoken = 225,
            you_want_to_live_forever = 226,
            gates_of_paradise = 228,
            the_currents_of_time = 229,
            a_new_horizon = 230,
            celestial_thunder = 231,
            the_celestial_capitol = 233,
            happily_ever_after = 234,
            nocturne_of_the_gods = 235,
            distant_promises = 240,
            memoria = 237,
            a_clouded_dawn = 236,
            a_time_for_prayer = 241,
            a_new_morning = 238,
            unity = 242,
            the_forgotten_city = 245,
            distant_worlds = 900,
            hook_line_and_sinker = 129,
            the_big_one = 136,
            jeuno_starlight_celebration = 239,
            onslaught = 219,
            depths_of_the_soul = 218,
            turmoil = 220,
            ruler_of_the_skies = 232,
            dusk_and_dawn = 224,
            a_realm_of_emptiness = 137    
        },
        treasures_of_aht_urhgan = {
            eastward_bound = 147,
            forbidden_seal = 148,
            jeweled_boughs = 149,
            ululations_from_beyond = 150,
            illusions_in_the_mist = 173,
            whispers_of_the_gods = 174,
            bandits_market = 175,
            circuit_de_chocobo = 176,
            run_chocobo_run = 177,
            the_bustle_of_the_capitol = 178,
            vanadiel_march_4 = 179,
            a_puppets_slumber = 183,
            eternal_gravestone = 184,
            ever_turning_woods = 185,
            an_invisible_crown = 189,
            the_colosseum = 146,
            choc_a_bye_baby = 188,
            mercenaries_delight = 138,
            delve = 139,
            rapid_onslaught_assault = 144,
            fated_strife_besieged = 142,
            hellriders = 143,
            black_coffin = 172,
            iron_colossus = 186,
            ragnarok = 187
        },
        wings_of_the_goddess = {
            title = 140,
            summers_lost = 45,
            everlasting_bonds = 54,
            march_of_the_allied_forces = 246,
            flowers_on_the_battlefield = 252,
            autumn_footfalls = 251,
            griffons_never_die = 254,
            echoes_of_a_zephyr = 253,
            thunder_of_the_march = 180,
            encampent_dreams = 145,
            the_cosmic_wheel = 141,
            stargazing = 182,
            young_griffons_in_flight = 248,
            cloister_of_time_and_souls = 40,
            royal_wanderlust = 41,
            where_lords_rule_not = 44,
            snowdrift_waltz = 42,
            troubled_shadows = 43,
            clash_of_standards = 215,
            on_this_blade = 216,
            roar_of_the_battle_drums = 247,
            run_maggot_run = 249,
            under_a_clouded_moon = 250,
            kindred_cry = 217,
            provenance_watcher = 55,
            goddess_divine = 46
        },
        seekers_of_adoulin = {
            a_new_direction = 58,
            the_pioneers = 59,
            the_sacred_city_of_adoulin = 63,
            into_lands_primeval = 60,
            arciela = 66,
            mog_resort = 67,
            waters_umbral_knell = 61,
            the_divine = 73,
            the_serpentine_labyrinth = 72,
            clouds_over_ulbuka = 74,
            worlds_away = 68,
            hades = 65,
            the_price = 75,
            forever_today = 76,
            forever_today_instrumental = 78,
            steel_sings_blades_dance = 57,
            breaking_ground = 64,
            keepers_of_the_wild = 62
        },
        add_ons = {
            iroha = 79,
            the_boundless_black = 80,
            isle_of_the_gods = 81,
            rhapsodies_of_vanadiel = 83,
            the_voracious_resurgence = 25,
            encroaching_perils = 27,
            the_destiny_destroyers = 28,
            black_stars_rise = 31,
            all_smiles = 32,
            we_are_vanadiel = 34,
            your_choice = 38,
            abyssea = 51,
            main_theme = 48,
            where_it_all_begins = 56,
            echoes_of_creation = 47,
            luck_of_the_mog = 49,
            a_feast_for_ladies = 50,
            melodies_errant = 52,
            shinryu = 53,
            wail_of_the_void = 82,
            the_devoured = 26,
            valhalla = 33,
            all_consuming_chaos = 37
        },
        extras = {
            full_speed_ahead = 84,
            monstrosity = 70,
            times_grow_tense = 85,
            between_dreams_and_reality = 88,
            disjoined_one = 89,
            for_a_friend = 87,
            winds_of_change = 90,
            goddesspeed = 35,
            good_fortune = 36,
            devils_delight = 28,
            sojourner = 30,
            distant_worlds_nanaa_mihgo = 69,
            the_pioneers_nanaa_mihgo = 71,
            distant_worlds_instrumental = 77,
            the_shadow_lord_battle_ffrk = 86
        },
        system = {
            silent = 9999,
            normal = 09,
            mount = 84,
            chocobo = 212,
            zone = 00,
            shuffle = 999
        },
    },
    types = {
        battle_solo = 2,
        battle_party = 3,
        idle_day = 0,
        idle_night = 1,
        mount = 4
    }
}

stations = {
    receivers = T{
        solo = 'solo',
        party = 'party',
        day = 'day',
        night = 'night',
        mount = 'mount'
    },

    categories = T{
        ['100'] = 'Final Fantasy XI',
        ['101'] = 'Rise of the Zilart',
        ['102'] = 'Chains of Promathia',
        ['103'] = 'Treasures of Aht Urhgan',
        ['104'] = 'Wings of the Goddess',
        ['105'] = 'Seekers of Adoulin',
        ['106'] = 'Add-Ons',
        ['107'] = 'Extras',
        ['108'] = 'System'
    },
   
    frequencies = T{
    
        --(100) Final Fantasy XI --
        
        ['100.01'] = {
            musicType = 'battle', 
            callSign = 'Battle Theme',
            song = music.songs.final_fantasy_xi.battle_theme
        },
        ['100.02'] = {
            musicType = 'battle', 
            callSign = 'Battle Theme 2',
            song = music.songs.final_fantasy_xi.battle_theme_2
        },
        ['100.03'] = {
            musicType = 'battle', 
            callSign = 'Battle in the Dungeon',
            song = music.songs.final_fantasy_xi.battle_in_the_dungeon
        },
        ['100.04'] = {
            musicType = 'battle', 
            callSign = 'Battle in the Dungeon 2',
            song = music.songs.final_fantasy_xi.battle_in_the_dungeon_2
        },
        ['100.05'] = {
            musicType = 'battle', 
            callSign = 'Tough Battle',
            song = music.songs.final_fantasy_xi.tough_battle
        },
        ['100.06'] = {
            musicType = 'battle', 
            callSign = 'Awakening',
            song = music.songs.final_fantasy_xi.awakening
        },
        ['100.07'] = {
            musicType = 'zone', 
            callSign = 'A Road Once Traveled',
            song = music.songs.final_fantasy_xi.a_road_once_traveled
        },
        ['100.08'] = {
            musicType = 'zone', 
            callSign = 'Mhaura',
            song = music.songs.final_fantasy_xi.mhaura
        },
        ['100.09'] = {
            musicType = 'mount', 
            callSign = 'Voyager',
            song = music.songs.final_fantasy_xi.voyager
        },
        ['100.1'] = {
            musicType = 'zone', 
            callSign = 'The Kingdom of San d\'Oria',
            song = music.songs.final_fantasy_xi.the_kingdom_of_sandoria
        },
        ['100.11'] = {
            musicType = 'zone', 
            callSign = 'Vana\'diel March',
            song = music.songs.final_fantasy_xi.vanadiel_march
        },
        ['100.12'] = {
            musicType = 'zone', 
            callSign = 'Ronfaure',
            song = music.songs.final_fantasy_xi.ronfaure
        },
        ['100.13'] = {
            musicType = 'zone', 
            callSign = 'The Grand Duchy of Jeuno',
            song = music.songs.final_fantasy_xi.the_grand_duchy_of_jeuno
        },
        ['100.14'] = {
            musicType = 'zone', 
            callSign = 'Blackout',
            song = music.songs.final_fantasy_xi.blackout
        },
        ['100.15'] = {
            musicType = 'zone', 
            callSign = 'Selbina',
            song = music.songs.final_fantasy_xi.selbina
        },
        ['100.16'] = {
            musicType = 'zone', 
            callSign = 'Sarutabaruta',
            song = music.songs.final_fantasy_xi.sarutabaruta
        },
        ['100.17'] = {
            musicType = 'zone', 
            callSign = 'Batallia Downs',
            song = music.songs.final_fantasy_xi.batallia_downs
        },
        ['100.18'] = {
            musicType = 'zone', 
            callSign = 'Gustaberg',
            song = music.songs.final_fantasy_xi.gustaberg
        },
        ['100.19'] = {
            musicType = 'zone', 
            callSign = 'Ru\'lude Gardens',
            song = music.songs.final_fantasy_xi.rulude_gardens
        },
        ['100.2'] = {
            musicType = 'zone', 
            callSign = 'Rolanberry Fields',
            song = music.songs.final_fantasy_xi.rolanberry_fields
        },
        ['100.21'] = {
            musicType = 'zone', 
            callSign = 'Vana\'diel March #2',
            song = music.songs.final_fantasy_xi.vanadiel_march_2
        },
        ['100.22'] = {
            musicType = 'battle', 
            callSign = 'Shadow Lord',
            song = music.songs.final_fantasy_xi.shadow_lord
        },
        ['100.23'] = {
            musicType = 'zone', 
            callSign = 'One Last Time/Just Once More',
            song = music.songs.final_fantasy_xi.one_last_time_just_once_more
        },
        ['100.24'] = {
            musicType = 'zone', 
            callSign = 'Hopelessness',
            song = music.songs.final_fantasy_xi.hopelessness
        },
        ['100.25'] = {
            musicType = 'zone', 
            callSign = 'Recollection',
            song = music.songs.final_fantasy_xi.recollection
        },
        ['100.26'] = {
            musicType = 'zone', 
            callSign = 'Mog House',
            song = music.songs.final_fantasy_xi.mog_house
        },
        ['100.27'] = {
            musicType = 'zone', 
            callSign = 'Anxiety',
            song = music.songs.final_fantasy_xi.anxiety
        },
        ['100.28'] = {
            musicType = 'mount', 
            callSign = 'Airship',
            song = music.songs.final_fantasy_xi.airship
        },
        ['100.29'] = {
            musicType = 'zone', 
            callSign = 'Tarutaru Female',
            song = music.songs.final_fantasy_xi.tarutaru_female
        },
        ['100.3'] = {
            musicType = 'zone', 
            callSign = 'Tarutaru Male',
            song = music.songs.final_fantasy_xi.tarutaru_male
        },
        ['100.31'] = {
            musicType = 'zone', 
            callSign = 'Elvaan Female',
            song = music.songs.final_fantasy_xi.elvaan_female
        },
        ['100.32'] = {
            musicType = 'zone', 
            callSign = 'Elvaan Male',
            song = music.songs.final_fantasy_xi.elvaan_male
        },
        ['100.33'] = {
            musicType = 'zone', 
            callSign = 'Hume Female',
            song = music.songs.final_fantasy_xi.hume_female
        },
        ['100.34'] = {
            musicType = 'zone', 
            callSign = 'Hume Male',
            song = music.songs.final_fantasy_xi.hume_male
        },
        ['100.35'] = {
            musicType = 'zone', 
            callSign = 'Mithra',
            song = music.songs.final_fantasy_xi.mithra
        },
        ['100.36'] = {
            musicType = 'zone', 
            callSign = 'Galka',
            song = music.songs.final_fantasy_xi.galka
        },
        ['100.37'] = {
            musicType = 'zone', 
            callSign = 'The Federation of Windurst',
            song = music.songs.final_fantasy_xi.the_federation_of_windurst
        },
        ['100.38'] = {
            musicType = 'zone', 
            callSign = 'The Republic of Bastok',
            song = music.songs.final_fantasy_xi.the_republic_of_bastok
        },
        ['100.39'] = {
            musicType = 'zone', 
            callSign = 'Prelude',
            song = music.songs.final_fantasy_xi.prelude
        },
        ['100.4'] = {
            musicType = 'zone', 
            callSign = 'Metalworks',
            song = music.songs.final_fantasy_xi.metalworks
        },
        ['100.41'] = {
            musicType = 'zone', 
            callSign = 'Castle Zvahl',
            song = music.songs.final_fantasy_xi.castle_zvahl
        },
        ['100.42'] = {
            musicType = 'zone', 
            callSign = 'Chateau d\'Oraguille',
            song = music.songs.final_fantasy_xi.chateau_doraguille
        },
        ['100.43'] = {
            musicType = 'zone', 
            callSign = 'Fury',
            song = music.songs.final_fantasy_xi.fury
        },
        ['100.41'] = {
            musicType = 'zone', 
            callSign = 'Saromugue Champaign',
            song = music.songs.final_fantasy_xi.saromugue_champaign
        },
        ['100.42'] = {
            musicType = 'zone', 
            callSign = 'Sorrow',
            song = music.songs.final_fantasy_xi.sorrow
        },
        ['100.43'] = {
            musicType = 'zone', 
            callSign = 'Repression',
            song = music.songs.final_fantasy_xi.repression
        },
        ['100.44'] = {
            musicType = 'zone', 
            callSign = 'Despair',
            song = music.songs.final_fantasy_xi.despair
        },
        ['100.45'] = {
            musicType = 'zone', 
            callSign = 'Heaven\'s Tower',
            song = music.songs.final_fantasy_xi.heavens_tower
        },
        ['100.46'] = {
            musicType = 'zone', 
            callSign = 'Sometime, Somewhere',
            song = music.songs.final_fantasy_xi.sometime_somewhere
        },
        ['100.47'] = {
            musicType = 'zone', 
            callSign = 'Xarcabard',
            song = music.songs.final_fantasy_xi.xarcabard
        },
        ['100.48'] = {
            musicType = 'zone', 
            callSign = 'Regeneracy',
            song = music.songs.final_fantasy_xi.regeneracy
        },
        ['100.49'] = {
            musicType = 'zone', 
            callSign = 'Eternal Oath',
            song = music.songs.final_fantasy_xi.eternal_oath
        },
        
        --(101) Rise of the Zilart --
      
        ['101.01'] = {
            musicType = 'battle', 
            callSign = 'Battle Theme 3',
            song = music.songs.rise_of_the_zilart.battle_theme_3
        },
        ['101.02'] = {
            musicType = 'battle', 
            callSign = 'Battle in the Dungeon 3',
            song = music.songs.rise_of_the_zilart.battle_in_the_dungeon_3
        },
        ['101.03'] = {
            musicType = 'battle', 
            callSign = 'Tough Battle 2',
            song = music.songs.rise_of_the_zilart.tough_battle_2
        },
        ['101.04'] = {
            musicType = 'battle', 
            callSign = 'Fighters of the Crystal',
            song = music.songs.rise_of_the_zilart.fighters_of_the_crystal
        },
        ['101.05'] = {
            musicType = 'battle', 
            callSign = "Eald'narche",
            song = music.songs.rise_of_the_zilart.ealdnarche
        },
        ['101.06'] = {
            musicType = 'battle', 
            callSign = 'Belief',
            song = music.songs.rise_of_the_zilart.belief
        },
        ['101.07'] = {
            musicType = 'battle', 
            callSign = 'Buccaneers',
            song = music.songs.rise_of_the_zilart.buccaneers
        },
        ['101.08'] = {
            musicType = 'zone', 
            callSign = 'Yuhtunga Jungle',
            song = music.songs.rise_of_the_zilart.yuhtunga_jungle
        },
        ['101.09'] = {
            musicType = 'zone', 
            callSign = 'Kazham',
            song = music.songs.rise_of_the_zilart.kazham
        },
        ['101.1'] = {
            musicType = 'zone', 
            callSign = 'Altepa Desert',
            song = music.songs.rise_of_the_zilart.altepa_desert
        },
        ['101.11'] = {
            musicType = 'mount', 
            callSign = 'Dash de Chocobo',
            song = music.songs.rise_of_the_zilart.dash_de_chocobo
        },
        ['101.12'] = {
            musicType = 'zone', 
            callSign = 'The Sanctuary of Zi\'tah',
            song = music.songs.rise_of_the_zilart.the_sanctuary_of_zitah
        },
        ['101.13'] = {
            musicType = 'zone', 
            callSign = 'Bloody Promises',
            song = music.songs.rise_of_the_zilart.bloody_promises
        },
        ['101.14'] = {
            musicType = 'zone', 
            callSign = 'To The Heavens',
            song = music.songs.rise_of_the_zilart.to_the_heavens
        },
        ['101.15'] = {
            musicType = 'zone', 
            callSign = 'Grav\'iton',
            song = music.songs.rise_of_the_zilart.graviton
        },
        ['101.16'] = {
            musicType = 'zone', 
            callSign = 'Hidden Truths',
            song = music.songs.rise_of_the_zilart.hidden_truths
        },
        ['101.17'] = {
            musicType = 'zone', 
            callSign = 'End Theme',
            song = music.songs.rise_of_the_zilart.end_theme
        },
        ['101.18'] = {
            musicType = 'zone', 
            callSign = 'Moongate',
            song = music.songs.rise_of_the_zilart.moongate
        },
        ['101.19'] = {
            musicType = 'zone', 
            callSign = 'Revenant Maiden',
            song = music.songs.rise_of_the_zilart.revenant_maiden
        },
        ['101.2'] = {
            musicType = 'zone', 
            callSign = 'Ve\'lugannon Palace',
            song = music.songs.rise_of_the_zilart.velugannon_palace
        },
        ['101.21'] = {
            musicType = 'zone', 
            callSign = 'Rabao',
            song = music.songs.rise_of_the_zilart.rabao
        },
        ['101.22'] = {
            musicType = 'zone', 
            callSign = 'Norg',
            song = music.songs.rise_of_the_zilart.norg
        },
        ['101.23'] = {
            musicType = 'zone', 
            callSign = 'Tu\'Lia',
            song = music.songs.rise_of_the_zilart.tulia
        },
        ['101.24'] = {
            musicType = 'zone', 
            callSign = 'Ro\'Maeve',
            song = music.songs.rise_of_the_zilart.romaeve
        },
        ['101.25'] = {
            musicType = 'zone', 
            callSign = 'Hall of the Gods',
            song = music.songs.rise_of_the_zilart.hall_of_the_gods
        },
        ['101.26'] = {
            musicType = 'zone', 
            callSign = 'Sunbreeze Shuffle',
            song = music.songs.rise_of_the_zilart.sunbreeze_shuffle
        },
        
        --(102) Chains of Promathia --

        ['102.01'] = {
            musicType = 'battle', 
            callSign = 'Onslaught',
            song = music.songs.chains_of_promathia.onslaught
        },
        ['102.02'] = {
            musicType = 'battle', 
            callSign = 'Depths of the Soul',
            song = music.songs.chains_of_promathia.depths_of_the_soul
        },
        ['102.03'] = {
            musicType = 'battle', 
            callSign = 'Turmoil',
            song = music.songs.chains_of_promathia.turmoil
        },
        ['102.04'] = {
            musicType = 'battle', 
            callSign = 'Ruler of the Skies',
            song = music.songs.chains_of_promathia.ruler_of_the_skies
        },
        ['102.05'] = {
            musicType = 'battle', 
            callSign = 'Dusk and Dawn',
            song = music.songs.chains_of_promathia.dusk_and_dawn
        },
        ['102.06'] = {
            musicType = 'battle', 
            callSign = 'A Realm of Emptiness',
            song = music.songs.chains_of_promathia.a_realm_of_emptiness
        },
        ['102.07'] = {
            musicType = 'zone', 
            callSign = 'Moblin Menagerie',
            song = music.songs.chains_of_promathia.moblin_menagerie
        },
        ['102.08'] = {
            musicType = 'zone', 
            callSign = 'Faded Memories',
            song = music.songs.chains_of_promathia.faded_memories
        },
        ['102.09'] = {
            musicType = 'battle', 
            callSign = 'March of the Hero',
            song = music.songs.chains_of_promathia.march_of_the_hero
        },
        ['102.1'] = {
            musicType = 'zone', 
            callSign = 'Words Unspoken',
            song = music.songs.chains_of_promathia.words_unspoken
        },
        ['102.11'] = {
            musicType = 'battle', 
            callSign = 'You Want to Live Forever?',
            song = music.songs.chains_of_promathia.you_want_to_live_forever
        },
        ['102.12'] = {
            musicType = 'zone', 
            callSign = 'Gates of Paradise',
            song = music.songs.chains_of_promathia.gates_of_paradise
        },
        ['102.13'] = {
            musicType = 'zone', 
            callSign = 'The Currents of Time',
            song = music.songs.chains_of_promathia.the_currents_of_time
        },
        ['102.14'] = {
            musicType = 'zone', 
            callSign = 'A New Horizon',
            song = music.songs.chains_of_promathia.a_new_horizon
        },
        ['102.15'] = {
            musicType = 'zone', 
            callSign = 'Celestial Thunder',
            song = music.songs.chains_of_promathia.celestial_thunder
        },
        ['102.16'] = {
            musicType = 'zone', 
            callSign = 'The Celestial Capitol',
            song = music.songs.chains_of_promathia.the_celestial_capitol
        },
        ['102.17'] = {
            musicType = 'zone', 
            callSign = 'Happily Ever After',
            song = music.songs.chains_of_promathia.happily_ever_after
        },
        ['102.18'] = {
            musicType = 'zone', 
            callSign = 'Nocturne of the Gods',
            song = music.songs.chains_of_promathia.nocturne_of_the_gods
        },
        ['102.19'] = {
            musicType = 'zone', 
            callSign = 'Distant Promises',
            song = music.songs.chains_of_promathia.distant_promises
        },
        ['102.2'] = {
            musicType = 'zone', 
            callSign = 'Memoria',
            song = music.songs.chains_of_promathia.memoria
        },
        ['102.21'] = {
            musicType = 'zone', 
            callSign = 'A Clouded Dawn',
            song = music.songs.chains_of_promathia.a_clouded_dawn
        },
        ['102.22'] = {
            musicType = 'zone', 
            callSign = 'A Time for Prayer',
            song = music.songs.chains_of_promathia.a_time_for_prayer
        },
        ['102.23'] = {
            musicType = 'zone', 
            callSign = 'A New Morning',
            song = music.songs.chains_of_promathia.a_new_morning
        },
        ['102.24'] = {
            musicType = 'zone', 
            callSign = 'Unity',
            song = music.songs.chains_of_promathia.unity
        },
        ['102.25'] = {
            musicType = 'zone', 
            callSign = 'The Forgotten City',
            song = music.songs.chains_of_promathia.the_forgotten_city
        },
        ['102.26'] = {
            musicType = 'zone', 
            callSign = 'Distant Worlds',
            song = music.songs.chains_of_promathia.distant_worlds
        },
        ['102.27'] = {
            musicType = 'zone', 
            callSign = 'Hook, Line, and Sinker',
            song = music.songs.chains_of_promathia.hook_line_and_sinker
        },
        ['102.28'] = {
            musicType = 'zone', 
            callSign = 'The Big One',
            song = music.songs.chains_of_promathia.the_big_one
        },
        ['102.29'] = {
            musicType = 'zone', 
            callSign = 'Jeuno - Starlight Celebration',
            song = music.songs.chains_of_promathia.jeuno_starlight_celebration
        },
        
        --(103) Treasures of Aht Urhgan --
        
        ['103.01'] = {
            musicType = 'battle', 
            callSign = "Mercenaries' Delight",
            song = music.songs.treasures_of_aht_urhgan.mercenaries_delight
        },
        ['103.02'] = {
            musicType = 'battle', 
            callSign = 'Delve',
            song = music.songs.treasures_of_aht_urhgan.delve
        },
        ['103.03'] = {
            musicType = 'battle', 
            callSign = 'Rapid Onslaught -Assult-',
            song = music.songs.treasures_of_aht_urhgan.rapid_onslaught_assault
        },
        ['103.04'] = {
            musicType = 'battle', 
            callSign = 'Fated Strife -Besieged-',
            song = music.songs.treasures_of_aht_urhgan.fated_strife_besieged
        },
        ['103.05'] = {
            musicType = 'battle', 
            callSign = 'Hellriders',
            song = music.songs.treasures_of_aht_urhgan.hellriders
        },
        ['103.06'] = {
            musicType = 'battle', 
            callSign = 'Black Coffin',
            song = music.songs.treasures_of_aht_urhgan.black_coffin
        },
        ['103.07'] = {
            musicType = 'battle', 
            callSign = 'Iron Colossus',
            song = music.songs.treasures_of_aht_urhgan.iron_colossus
        },
        ['103.08'] = {
            musicType = 'battle', 
            callSign = 'Ragnarok',
            song = music.songs.treasures_of_aht_urhgan.ragnarok
        },
        ['103.09'] = {
            musicType = 'mount', 
            callSign = 'Eastword Bound',
            song = music.songs.treasures_of_aht_urhgan.eastward_bound
        },
        ['103.1'] = {
            musicType = 'zone', 
            callSign = 'Forbidden Seal',
            song = music.songs.treasures_of_aht_urhgan.forbidden_seal
        },
        ['103.11'] = {
            musicType = 'zone', 
            callSign = 'Jeweled Boughs',
            song = music.songs.treasures_of_aht_urhgan.jeweled_boughs
        },
        ['103.12'] = {
            musicType = 'zone', 
            callSign = 'Ululations from Beyond',
            song = music.songs.treasures_of_aht_urhgan.ululations_from_beyond
        },
        ['103.13'] = {
            musicType = 'zone', 
            callSign = 'Illusions in the Mist',
            song = music.songs.treasures_of_aht_urhgan.illusions_in_the_mist
        },
        ['103.14'] = {
            musicType = 'zone', 
            callSign = 'Whispers of the Gods',
            song = music.songs.treasures_of_aht_urhgan.whispers_of_the_gods
        },
        ['103.15'] = {
            musicType = 'zone', 
            callSign = 'Bandit\'s Market',
            song = music.songs.treasures_of_aht_urhgan.bandits_market
        },
        ['103.16'] = {
            musicType = 'mount', 
            callSign = 'Circuit de Chocobo',
            song = music.songs.treasures_of_aht_urhgan.circuit_de_chocobo
        },
        ['103.17'] = {
            musicType = 'mount', 
            callSign = 'Run, Chocobo Run!',
            song = music.songs.treasures_of_aht_urhgan.run_chocobo_run
        },
        ['103.18'] = {
            musicType = 'zone', 
            callSign = 'The Bustle of the Capitol',
            song = music.songs.treasures_of_aht_urhgan.the_bustle_of_the_capitol
        },
        ['103.19'] = {
            musicType = 'zone', 
            callSign = 'Vana\'diel March #4',
            song = music.songs.treasures_of_aht_urhgan.vanadiel_march_4
        },
        ['103.2'] = {
            musicType = 'zone', 
            callSign = 'A Puppet\'s Slumber',
            song = music.songs.treasures_of_aht_urhgan.a_puppets_slumber
        },
        ['103.21'] = {
            musicType = 'zone', 
            callSign = 'Eternal Gravestone',
            song = music.songs.treasures_of_aht_urhgan.eternal_gravestone
        },
        ['103.22'] = {
            musicType = 'zone', 
            callSign = 'Ever-turning Woods',
            song = music.songs.treasures_of_aht_urhgan.ever_turning_woods
        },
        ['103.23'] = {
            musicType = 'zone', 
            callSign = 'An Invisible Crown',
            song = music.songs.treasures_of_aht_urhgan.an_invisible_crown
        },
        ['103.24'] = {
            musicType = 'battle', 
            callSign = 'The Colosseum',
            song = music.songs.treasures_of_aht_urhgan.the_colosseum
        },
        ['103.25'] = {
            musicType = 'mount', 
            callSign = 'Choc-A-Bye-Baby',
            song = music.songs.treasures_of_aht_urhgan.choc_a_bye_baby
        },
        
        --(104) Wings of the Goddess --
        
        ['104.01'] = {
            musicType = 'battle', 
            callSign = 'Clash of Standards',
            song = music.songs.wings_of_the_goddess.clash_of_standards
        },
        ['104.02'] = {
            musicType = 'battle', 
            callSign = 'On this Blade',
            song = music.songs.wings_of_the_goddess.on_this_blade
        },
        ['104.03'] = {
            musicType = 'battle', 
            callSign = 'Roar of the Battle Drums',
            song = music.songs.wings_of_the_goddess.roar_of_the_battle_drums
        },
        ['104.04'] = {
            musicType = 'battle', 
            callSign = 'Run Maggot, Run!',
            song = music.songs.wings_of_the_goddess.run_maggot_run
        },
        ['104.05'] = {
            musicType = 'battle', 
            callSign = 'Under a Clouded Moon',
            song = music.songs.wings_of_the_goddess.under_a_clouded_moon
        },
        ['104.06'] = {
            musicType = 'battle', 
            callSign = 'Kindred Cry',
            song = music.songs.wings_of_the_goddess.kindred_cry
        },
        ['104.07'] = {
            musicType = 'battle', 
            callSign = 'Provenance Watcher',
            song = music.songs.wings_of_the_goddess.provenance_watcher
        },
        ['104.08'] = {
            musicType = 'battle', 
            callSign = 'Goddess Divine',
            song = music.songs.wings_of_the_goddess.goddess_divine
        },
        ['104.09'] = {
            musicType = 'zone', 
            callSign = 'Wings of the Goddess',
            song = music.songs.wings_of_the_goddess.title
        },
        ['104.1'] = {
            musicType = 'zone', 
            callSign = 'Summers Lost',
            song = music.songs.wings_of_the_goddess.summers_lost
        },
        ['104.11'] = {
            musicType = 'zone', 
            callSign = 'Everlasting Bonds',
            song = music.songs.wings_of_the_goddess.everlasting_bonds
        },
        ['104.12'] = {
            musicType = 'zone', 
            callSign = 'March of the Allied Forces',
            song = music.songs.wings_of_the_goddess.march_of_the_allied_forces
        },
        ['104.13'] = {
            musicType = 'zone', 
            callSign = 'Flowers on the Battlefield',
            song = music.songs.wings_of_the_goddess.flowers_on_the_battlefield
        },
        ['104.14'] = {
            musicType = 'zone', 
            callSign = 'Autumn Footfalls',
            song = music.songs.wings_of_the_goddess.autumn_footfalls
        },
        ['104.15'] = {
            musicType = 'zone', 
            callSign = 'Griffons Never Die',
            song = music.songs.wings_of_the_goddess.griffons_never_die
        },
        ['104.16'] = {
            musicType = 'zone', 
            callSign = 'Echoes of a Zephyr',
            song = music.songs.wings_of_the_goddess.echoes_of_a_zephyr
        },
        ['104.17'] = {
            musicType = 'zone', 
            callSign = 'Thunder of the March',
            song = music.songs.wings_of_the_goddess.thunder_of_the_march
        },
        ['104.18'] = {
            musicType = 'zone', 
            callSign = 'Encampment Dreams',
            song = music.songs.wings_of_the_goddess.encampent_dreams
        },
        ['104.19'] = {
            musicType = 'zone', 
            callSign = 'The Cosmic Wheel',
            song = music.songs.wings_of_the_goddess.the_cosmic_wheel
        },
        ['104.2'] = {
            musicType = 'zone', 
            callSign = 'Stargazing',
            song = music.songs.wings_of_the_goddess.stargazing
        },
        ['104.21'] = {
            musicType = 'zone', 
            callSign = 'Young Griffons in Flight',
            song = music.songs.wings_of_the_goddess.young_griffons_in_flight
        },
        ['104.22'] = {
            musicType = 'zone', 
            callSign = 'Cloister of Time and Souls',
            song = music.songs.wings_of_the_goddess.cloister_of_time_and_souls
        },
        ['104.23'] = {
            musicType = 'zone', 
            callSign = 'Royal Wanderlust',
            song = music.songs.wings_of_the_goddess.royal_wanderlust
        },
        ['104.24'] = {
            musicType = 'zone', 
            callSign = 'Where Lords Rule Not',
            song = music.songs.wings_of_the_goddess.where_lords_rule_not
        },
        ['104.25'] = {
            musicType = 'zone', 
            callSign = 'Snowdrift Waltz',
            song = music.songs.wings_of_the_goddess.snowdrift_waltz
        },
        ['104.26'] = {
            musicType = 'zone', 
            callSign = 'Troubled Shadows',
            song = music.songs.wings_of_the_goddess.troubled_shadows
        },
      
        --(105) Seekers of Adoulin --
        
        ['105.01'] = {
            musicType = 'battle', 
            callSign = 'Steel Sings, Blades Dance',
            song = music.songs.seekers_of_adoulin.steel_sings_blades_dance
        },
        ['105.02'] = {
            musicType = 'battle', 
            callSign = 'Braking Ground',
            song = music.songs.seekers_of_adoulin.breaking_ground
        },
        ['105.03'] = {
            musicType = 'battle', 
            callSign = 'Keepers of the Wild',
            song = music.songs.seekers_of_adoulin.keepers_of_the_wild
        },
        ['105.04'] = {
            musicType = 'zone', 
            callSign = 'A New Direction',
            song = music.songs.seekers_of_adoulin.a_new_direction
        },
        ['105.05'] = {
            musicType = 'zone', 
            callSign = 'The Pioneers',
            song = music.songs.seekers_of_adoulin.the_pioneers
        },
        ['105.06'] = {
            musicType = 'zone', 
            callSign = 'The Sacred City of Adoulin',
            song = music.songs.seekers_of_adoulin.the_sacred_city_of_adoulin
        },
        ['105.07'] = {
            musicType = 'zone', 
            callSign = 'Into Lands Primeval',
            song = music.songs.seekers_of_adoulin.into_lands_primeval
        },
        ['105.08'] = {
            musicType = 'zone', 
            callSign = 'Arciela',
            song = music.songs.seekers_of_adoulin.arciela
        },
        ['105.09'] = {
            musicType = 'zone', 
            callSign = 'Mog Resort',
            song = music.songs.seekers_of_adoulin.mog_resort
        },
        ['105.1'] = {
            musicType = 'zone', 
            callSign = 'Water\'s Umbral Knell',
            song = music.songs.seekers_of_adoulin.waters_umbral_knell
        },
        ['105.11'] = {
            musicType = 'zone', 
            callSign = 'The Divine',
            song = music.songs.seekers_of_adoulin.the_divine
        },
        ['105.12'] = {
            musicType = 'zone', 
            callSign = 'The Serpentine Labyrinth',
            song = music.songs.seekers_of_adoulin.the_serpentine_labyrinth
        },
        ['105.13'] = {
            musicType = 'battle', 
            callSign = 'Clouds Over Ulbuka',
            song = music.songs.seekers_of_adoulin.clouds_over_ulbuka
        },
        ['105.14'] = {
            musicType = 'zone', 
            callSign = 'Worlds Away',
            song = music.songs.seekers_of_adoulin.worlds_away
        },
        ['105.15'] = {
            musicType = 'battle', 
            callSign = 'Hades',
            song = music.songs.seekers_of_adoulin.hades
        },
        ['105.16'] = {
            musicType = 'battle', 
            callSign = 'The Price',
            song = music.songs.seekers_of_adoulin.the_price
        },
        ['105.17'] = {
            musicType = 'zone', 
            callSign = 'Forever Today',
            song = music.songs.seekers_of_adoulin.forever_today
        },
        ['105.18'] = {
            musicType = 'zone', 
            callSign = 'Forever Today - Instrumental',
            song = music.songs.seekers_of_adoulin.forever_today_instrumental
        },
    
        --(106) Add-Ons --
        
        ['106.01'] = {
            musicType = 'battle', 
            callSign = 'Echoes of Creation',
            song = music.songs.add_ons.echoes_of_creation
        },
        ['106.02'] = {
            musicType = 'battle', 
            callSign = 'Luck of the Mog',
            song = music.songs.add_ons.luck_of_the_mog
        },
        ['106.03'] = {
            musicType = 'battle', 
            callSign = 'A Feast for Ladies',
            song = music.songs.add_ons.a_feast_for_ladies
        },
        ['106.04'] = {
            musicType = 'battle', 
            callSign = 'Melodies Errant',
            song = music.songs.add_ons.melodies_errant
        },
        ['106.05'] = {
            musicType = 'battle', 
            callSign = 'Shinryu',
            song = music.songs.add_ons.shinryu
        },
        ['106.06'] = {
            musicType = 'battle', 
            callSign = 'Wail of the Void',
            song = music.songs.add_ons.wail_of_the_void
        },
        ['106.07'] = {
            musicType = 'battle', 
            callSign = 'The Devoured',
            song = music.songs.add_ons.the_devoured
        },
        ['106.08'] = {
            musicType = 'battle', 
            callSign = 'Valhalla',
            song = music.songs.add_ons.valhalla
        },
        ['106.09'] = {
            musicType = 'battle', 
            callSign = 'All Consuming Chaos',
            song = music.songs.add_ons.all_consuming_chaos
        },
        ['106.1'] = {
            musicType = 'zone', 
            callSign = 'Iroha',
            song = music.songs.add_ons.iroha
        },
        ['106.11'] = {
            musicType = 'zone', 
            callSign = 'The Boundless Black',
            song = music.songs.add_ons.the_boundless_black
        },
        ['106.12'] = {
            musicType = 'zone', 
            callSign = 'Isle of the Gods',
            song = music.songs.add_ons.isle_of_the_gods
        },
        ['106.13'] = {
            musicType = 'zone', 
            callSign = 'Rhapsodies of Vana\'diel',
            song = music.songs.add_ons.rhapsodies_of_vanadiel
        },
        ['106.14'] = {
            musicType = 'zone', 
            callSign = 'The Voracious Resurgence',
            song = music.songs.add_ons.the_voracious_resurgence
        },
        ['106.15'] = {
            musicType = 'zone', 
            callSign = 'Encroaching Perils',
            song = music.songs.add_ons.encroaching_perils
        },
        ['106.16'] = {
            musicType = 'zone', 
            callSign = 'The Destiny Destroyers',
            song = music.songs.add_ons.the_destiny_destroyers
        },
        ['106.17'] = {
            musicType = 'zone', 
            callSign = 'Black Stars Rise',
            song = music.songs.add_ons.black_stars_rise
        },
        ['106.18'] = {
            musicType = 'zone', 
            callSign = 'All Smiles',
            song = music.songs.add_ons.all_smiles
        },
        ['106.19'] = {
            musicType = 'zone', 
            callSign = 'We Are Vana\'diel',
            song = music.songs.add_ons.we_are_vanadiel
        },
        ['106.2'] = {
            musicType = 'zone', 
            callSign = 'Your Choice',
            song = music.songs.add_ons.your_choice
        },
        ['106.21'] = {
            musicType = 'zone', 
            callSign = 'Abyssea',
            song = music.songs.add_ons.abyssea
        },
        ['106.22'] = {
            musicType = 'zone', 
            callSign = 'Main Theme',
            song = music.songs.add_ons.main_theme
        },
        ['106.23'] = {
            musicType = 'zone', 
            callSign = 'Where It All Begins',
            song = music.songs.add_ons.where_it_all_begins
        },
        
        --(107) Extras --
        
        ['107.01'] = {
            musicType = 'mount', 
            callSign = 'Full Speed Ahead',
            song = music.songs.extras.full_speed_ahead
        },
        ['107.02'] = {
            musicType = 'battle', 
            callSign = 'Monstrosity',
            song = music.songs.extras.monstrosity
        },
        ['107.03'] = {
            musicType = 'battle', 
            callSign = 'Times Grow Tense',
            song = music.songs.extras.times_grow_tense
        },
        ['107.04'] = {
            musicType = 'battle', 
            callSign = 'Between Dreams and Reality',
            song = music.songs.extras.between_dreams_and_reality
        },
        ['107.05'] = {
            musicType = 'battle', 
            callSign = 'Disjoined One',
            song = music.songs.extras.disjoined_one
        },
        ['107.06'] = {
            musicType = 'zone', 
            callSign = 'For A Friend',
            song = music.songs.extras.for_a_friend
        },
        ['107.07'] = {
            musicType = 'battle', 
            callSign = 'Winds of Change',
            song = music.songs.extras.winds_of_change
        },
        ['107.08'] = {
            musicType = 'zone', 
            callSign = 'Goddesspeed',
            song = music.songs.extras.goddesspeed
        },
        ['107.09'] = {
            musicType = 'zone', 
            callSign = 'Good Fortune',
            song = music.songs.extras.good_fortune
        },
        ['107.1'] = {
            musicType = 'zone', 
            callSign = 'Good Fortune',
            song = music.songs.extras.good_fortune
        },
        ['107.11'] = {
            musicType = 'zone', 
            callSign = 'Devil\'s Delight',
            song = music.songs.extras.devils_delight
        },
        ['107.12'] = {
            musicType = 'battle', 
            callSign = 'Sojourner',
            song = music.songs.extras.sojourner
        },
        ['107.13'] = {
            musicType = 'zone', 
            callSign = 'Distant Worlds - Nanaa Mihgo Version',
            song = music.songs.extras.distant_worlds_nanaa_mihgo
        },
        ['107.14'] = {
            musicType = 'zone', 
            callSign = 'The Pioneers - Nanaa Mihgo Version',
            song = music.songs.extras.the_pioneers_nanaa_mihgo
        },
        ['107.15'] = {
            musicType = 'zone', 
            callSign = 'Distant Worlds - Instrumental',
            song = music.songs.extras.distant_worlds_instrumental
        },
        ['107.16'] = {
            musicType = 'battle', 
            callSign = 'The Shadow Lord Battle - FFRK Version',
            song = music.songs.extras.the_shadow_lord_battle_ffrk
        },

        --(108) System --

        ['108.01'] = {
            musicType = 'system', 
            callSign = 'No Music',
            song = music.songs.system.silent
        },
        ['108.02'] = {
            musicType = 'system', 
            callSign = 'Original Music',
            song = music.songs.system.normal
        },
        ['108.03'] = {
            musicType = 'system', 
            callSign = 'Current Zone Music (Default)',
            song = music.songs.system.zone
        },
        ['108.04'] = {
            musicType = 'system', 
            callSign = 'Mount',
            song = music.songs.system.mount
        },
        ['108.05'] = {
            musicType = 'system', 
            callSign = 'Chocobo',
            song = music.songs.system.chocobo
        },
        ['108.06'] = {
            musicType = 'system', 
            callSign = 'Shuffle',
            song = music.songs.system.shuffle
        },
    }
}

return {
    packets = packets,
    player = player,
    colors = colors,
    music = music, 
    stations = stations    
}