# plug_editor_launcher

Editor Launcher for PhoenixLiveReload

## Background 

Phoenix Live Reload has a heex-jump feature that allows the developer to jump
from a component on an HTML page to the text-editor source.

This feature was launch by Chris McCord in his 2023 Elixir Conf Talk.

Per the PhoenixLiveReload documentation, heex-jump requires a protocol to be
defined in environment variable PLUG_EDITOR.

The developer is responsible for establishing a protocol handler.

Developers use many combinations of operating systems, editors and terminal
emulators.

This is a framework to streamline the configuration of an editor-launcher
protocol handler across a variety of environments.

## Status

As of 2024 Jul 23 Tue, this has only been tested on Xubuntu 22.04.

- Terminals: Terminator, Kitty 
- Editors: neovim, vscode, mousepad 

Probably this framework is going to work fine on other varieties of Linux, and
can be adapted to work on Mac.  

I don't know if this can be adapted to work on Windows.

## The plug-edit protocol

The plug-edit protocol is as follows:

    plug-edit:<file>:<line_number>:<editor>:<terminal_emulator>

For 'console' editors like Neovim or Emacs, the terminal_emulator field is required.
For 'native' editors like vscode or sublime, the terminal_emulator field is ignored.

## Installing 

- clone the repo 
- run the installer 'install.sh'

## Testing 

These commands should work from the command line: 

    $ xdg-mime query default x-scheme-handler/plug-edit 
    $ cat ~/.local/share/applications/plug-editor.desktop 
    $ which plug_editor_launch 
    $ xdg-open plug-edit:$HOME/.bashrc:0:vscode 
    $ xdg-open plug-edit:$HOME/.bashrc:0:vim:xterm 
    $ xdg-open plug-edit:$HOME/.bashrc:0:neovim:kitty 
    $ plug_editor_launch plug-edit:$HOME/.bashrc:0:vscode 
    $ plug_editor_launch plug-edit:$HOME/.bashrc:0:vim:xterm 
    $ plug_editor_launch plug-edit:$HOME/.bashrc:0:neovim:kitty 

These commands should work from the browser console: 

    $ window.location.href = "plug-edit:/home/<yourid>/.bashrc:0:<youreditor>:<yourterm>";

## How it works: Phoenix-to-Browser

Phoenix Setup 
- Phoenix puts debug comments in the HTML with file and line number info
- The developer puts click-handler code into 'app.js'
- A reloader channel is established, exposing the value for 'PLUG_EDITOR'

On Click 
- A javascript handler invokes `reloader.openEditorAtTarget` or `reloader.openEditorAtCaller`
- These functions call "window.href = "

- Using the setting in PLUG_EDITOR, the click handler code invokes "window.location.href = 'plug-edit:__FILE__:__LINE__:<editor>:<terminal_emulator>'"

## How it works: Browser-to-Editor

Protocol Setup 


## Status 

## Contributing 

PRs welcome!  

## Reference 

## Related Projects
