# Sandow Plus Plus
A mod for **Skyrim SE**. Gain weight (muscles) as you play.

You can find this mod at the [Nexus](https://www.nexusmods.com/skyrimspecialedition/mods/32579) (***WARNING: NFSW-ish pics***)

## For non-programmers
This git page is meant to be used by programmers, not the general public.

For everything game related, please see the mod page above.

## Building
The easiest way to test and develop the Lua code here is using [ZeroBrane Studio](https://studio.zerobrane.com/).

To be able to test or release this project, run `SKSE\Plugins\JCData\lua\_debug.lua`.\
You need to change the last line of that file depending on if you are releasing or developing.

***Beware***: that's a quick and dirty file. You need to adhere to all conventions used by the Lua files in this mod for it to work:
- Lines pointing to my lib (see hard dependencies) and other Lua libraries must be `package.path = package.path`, verbatim. Easiest way is to just copy them for one of my old files.\
Remember to update their paths.

[Serpent: Lua serializer and pretty printer](http://notebook.kulchenko.com/programming/serpent-lua-serializer-pretty-printer) is highly suggested to be able to print tables to see what values they carry while developing code.


### Visual Studio Code
This project was made in [Visual Studio Code](https://code.visualstudio.com/) and it shows.\
Did you notice some "weird" indentations? Those were made because VSCode can fold code based on indentation; you can fold large regions of code thanks to it.

#### Plugins
These aren't mandatory per se, but highly suggested. This project has configuration files for many of them, anyway.
* [Papyrus for Visual Studio Code](https://marketplace.visualstudio.com/items?itemName=joelday.papyrus-lang-vscode). Well, this plugin is so good is mostly mandatory.\
    That extension provides a Task to build the project using the `skyrimse.ppj` file. Notice you will need to download a more recent version of [Pyro](https://wiki.fireundubh.com/pyro) and extract it to this plugin's folder (usually `%user%\.vscode\extensions\joelday.papyrus-lang-vscode-x.xx.x\pyro`), or you will get many errors while trying to build the project.

    This project includes a task that builds this project using Pyro, should you can't/want to use this extension.\
    Said task is found in `.vscode\tasks.json`.

    Either way, remember to update all your paths on both `skyrimse.ppj` and/or `.vscode\tasks.json` or you will get errors.
* [Hightlight](https://marketplace.visualstudio.com/items?itemName=fabiospampinato.vscode-highlight). This extension is **highly suggested**. There are comments and remarks all over the place that get highlighted when you install this.
* [Fold Plus](https://marketplace.visualstudio.com/items?itemName=dakara.dakara-foldplus)
* [Numbered Bookmarks](https://marketplace.visualstudio.com/items?itemName=alefragnani.numbered-bookmarks)
* [Clipboard Manager](https://marketplace.visualstudio.com/items?itemName=EdgardMessias.clipboard-manager)
* [Tokyo Night](https://marketplace.visualstudio.com/items?itemName=enkia.tokyo-night). I love this theme and I don't want to lose it if something goes wrong, so I leave a link here.

### Hard dependencies
***THESE FILES ARE NOT OPTIONAL***. This mod will simply fail to compile without them.\
Remember to update path for all of them in the `skyrimse.ppj` file.

- My [library](https://github.com/CarlosLeyvaAyala/DM-SkyrimSE-Library.git).
- [JContainers SE](https://www.nexusmods.com/skyrimspecialedition/mods/16495).
- [SkyUI SDK](https://github.com/schlangster/skyui/wiki).
- [SkyUI](https://www.nexusmods.com/skyrimspecialedition/mods/12604). You will need to extract its BSA to be able to compile this project.
- [Racemenu](https://www.nexusmods.com/skyrimspecialedition/mods/19080). Same as above, even if you don't plan to use the muscle definition features.

### Soft dependencies
These aren't integral for this mod. They are mostly integrations that can be commented because they take only a few lines.
- [Sexlab framework](https://www.loverslab.com/topic/91861-sexlab-framework-se-163-beta-8-november-22nd-2019/).

## Distributing

### On extra files
These files come from [SkyUI](https://github.com/schlangster/skyui.git) and they are here only to easily build the project. ***Don't distribute this mod with them***:
- SKI_WidgetBase
- SKI_WidgetManager

These were directly added because using the whole repo as a submodule for only two scripts that were last updated in 2015 is overkill.


## Useful links
Some other external programs or pages that were used to make this mod.
* [Number cruncher](https://docs.google.com/spreadsheets/d/1r10g-b73KjagmzT5Rm1SrWUY7ROhxtawBxy-vV4Yyms/edit?usp=sharing). Calculations made to balance this mod.
* [Interactive LaTeX Editor](https://arachnoid.com/latex/). Images for the formulas were made in this.
