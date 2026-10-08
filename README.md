**BattleStations Author:** [Sjshovan (Apogee)](https://github.com/Ap0gee)  

**MusicBox Author:** [Johnathan Clause(daywalker)](https://github.com/johnathan-clause)
**Version:** v1.1.0  


# Music Box

> A Fork of the Windower 4 addon 'MusicBox' that allows the user to change or remove not just the battle music, but all of the music in Final Fantasy 11 Online!


### Table of Contents

- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Aliases](#aliases)
- [Usage](#usage)
- [Commands](#commands)
- [Support](#support)
- [Change Log](#change-log)
- [Known Issues](#known-issues)
- [TODOs](#todos)
- [License](#license)

___
### Prerequisites
1. [Final Fantasy 11 Online](http://www.playonline.com/ff11us/index.shtml)
2. [Windower 4](http://windower.net/)

___
### Installation

**Manual:**
1. Navigate to <https://github.com/johnathan-clause/MusicBox>.
2. Click on `Releases`. 
3. Click on the `Source code (zip)` link within the latest release to download.
4. Place the .zip into your windower directory. 
5. Right-click the .zip file and select *Extract here*, if prompted to replace files or directories select *Yes to all*.

___
### Aliases
The following aliases are available to Music Box commands:    

**musicbox:** stations | mb   
**list:** l    
**set:** s   
**get:** g  
**default:** d    
**normal:** n   
**reload:** r  
**about:** a  
**help:** h   
**stations:** station | s   
**radios:** receivers | receiver | radio | r   
> *Day* | *Night* | *Solo* | *Party* | *Mount*
**all:** all | a | *   

___
### Usage

Manually load the addon by using one of the following commands:
    
    //lua load musicbox 
    //lua l musicbox

___    
### Commands 

**help**

Displays the available Music Box commands. Below are the equivalent ways of calling the command:

    //musicbox help
    //mb help
    
    //musicbox h
    //mb h

**list _[radios|stations] [category#]_** 

Displays the available radios and or stations. Below are some useage examples of this command:
    
    //mb list
    //mb l
    
    //mb list radios
    //mb l radios
    //mb l r
    
    //mb list stations
    //mb l stations
    //mb l s
    
    //mb l s 100
    
* _**[radios|stations]:**_ Optional parameter used to filter the list display to show only available radios or stations. If neither filter type is present, all available stations and radios will be listed.    
* _**[category#]:**_ Optional parameter used to filter the list of stations by the given category number. The available category numbers are 100-107.
   
**set _\<station> <radio>_**

Sets the zone radio(s) to the given station. Overrides global radios. Below are some useage examples of this command:

    //mb set 100.01
    //mb s 100.01
    
    //mb s 100.01 day
    //mb s 100.01 mount
    
* _**\<station>:**_ Required parameter.     
* _**\<radio>:**_ Required parameter used to specify which radio to set the given station to. If no radio type is present both radios will be set to the given station.    

**set global _\<station> <radio>_**

Sets the global radio(s) to the given station. Overrides default radios. Below are some useage examples of this command:

    //mb setglobal 100.01
    //mb sg 100.01
    
    //mb sg 100.01 day
    //mb sg 100.01 mount
    
* _**\<station>:**_ Required parameter.     
* _**\<radio>:**_ Required parameter used to specify which radio to set the given station to. If no radio type is present both radios will be set to the given station.    

**get _\<radio>_** 

Displays the currently set station on the given radio(s).  Below are some useage examples of this command:

    //mb get
    //mb g
    
    //mb g day
    //mb g party

* _**\<radio>:**_ Required parameter used to specify the radio for which you would like to display the currently set station. If no radio type is present, the currently set station for both radios will be displayed.

**default _\<radio>_**

Sets the given radio(s) to the default station (Current Zone Music). Below are some useage examples of this command:

    //mb default
    //mb d
    
    //mb d solo
    //mb d mount
    
* _**\<radio>:**_ Required parameter used to specify which radio to set the default station to. If no radio type is present, both radios will be set to the default station.

**savedefaults**

Saves your current settings as the default settings. WARNING!!! These changes are irreversible! Below are some useage examples of this command:

    //mb savedefaults
    //mb sd
    
* _**\<radio>:**_ Required parameter used to specify which radio to set the default station to. If no radio type is present, both radios will be set to the default station.

**normal _\<radio>_**

Sets the given radio(s) to the original game music. Below are some useage examples of this command:

    //mb normal
    //mb n
    
    //mb n night
    //mb n day
    
* _**\<radio>:**_ Required parameter used to specify which radio to set the normal station to. If no radio type is present, both radios will be set to the normal station.

**reload**

Reloads the Music Box addon. Below are the equivalent ways of calling the command:
    
    //musicbox reload
    //mb reload
    
    //musicbox r
    //mb r
    
**about**

Displays information about the Music Box addon. Below are the equivalent ways of calling the command:
    
    //musicbox about
    //mb about
    
    //musicbox a
    //mb a

___
### Support
**Having Issues with this addon?**
* Please let me know [here](https://github.com/johnathan-clause/MusicBox/issues/new).
  
**Have something to say?**
* Send me some feedback here: <johnathan.clause@outlook.com>

___
### Change Log

**v1.1.0** - 10/01/2026
- No need for Autoex or other tools

**v1.0.0** - 10/01/2026
- Initial release

___
### Known Issues

- **Issue:** During campaign battles in the past, the music switches from the campaign music to the normal zone music while stations are set to `108.03`.

___    
### TODOS

- **TODO:** 
___

### License

Copyright © 2018, [Sjshovan (Apogee)](https://github.com/Ap0gee).
Released under the [BSD License](LICENSE).

***
