# PlugEditorLaunch

Editor Launch for PhoenixLiveReload

## Background 

[Phoenix Live Reload][1] has a [heex-jump][2] feature to jump from a component
on an HTML page to the text-editor source. This feature was introduced by Chris
McCord in his [2023 Elixir Conf Talk][3].

Per the PhoenixLiveReload [documentation][2], heex-jump requires a protocol to
be defined in environment variable `PLUG_EDITOR`.  The developer is responsible
for establishing a protocol handler.

The purpose of `plug_editor_launch` is to streamline the protocol-handler
configuration for multiple editors and terminal emulators.

[1]: https://github.com/phoenixframework/phoenix_live_reload 
[2]: https://github.com/phoenixframework/phoenix_live_reload#jumping-to-heex-function-definitions 
[3]: https://www.youtube.com/watch?v=Ckgl9KO4E4M&t=1738s 

## Status

As of 23-July-2024, this has only been tested on Xubuntu 22.04.

- Terminals: [terminator][ttm], [kitty][tkt], [xterm][txt]
- Editors: [vim][evm], [neovim][env], [vscode][evs], [mousepad][emp]

Probably this framework is going to work fine on other varieties of Linux, and
can be adapted to work on Mac.  

I don't know if this can be adapted to work on Windows.

[ttm]: https://gnome-terminator.org 
[tkt]: https://sw.kovidgoyal.net/kitty 
[txt]: https://en.wikipedia.org/wiki/Xterm 
[evm]: https://www.vim.org/
[env]: https://neovim.io/ 
[evs]: https://code.visualstudio.com/ 
[emp]: https://en.wikipedia.org/wiki/Mousepad_(software) 

## The plug-edit protocol

The plug-edit protocol is as follows:

    plug-edit:<absolute_file_path>:<line_number>:<editor>:<terminal_emulator>

For 'console' editors like Neovim or Emacs, the terminal_emulator field is
required. For 'native' editors like vscode or sublime, the terminal_emulator
field is ignored.

The set of supported terminals and editors is defined in the
`plug_editor_launch` script.  Edit as you see fit.

## Installing 

Clone the repo and run the installer:

```
git clone https://github.com/andyl/plug_editor_launch 
plug_editor_launch/install.sh 
```

Then add this line to your `~/.bashrc`: 

```bash 
export PLUG_EDITOR=plug-edit:__FILE__:__LINE__:<editor>:<terminal_emulator>
```

## Testing 

From the command line: 

```
# Make sure the XDG desktop file is installed and configured
cat ~/.local/share/applications/plug-editor.desktop 
xdg-mime query default x-scheme-handler/plug-edit 
```

```
# Test-run the protocol using xdg-open 
xdg-open plug-edit:$HOME/.bashrc:0:vscode 
xdg-open plug-edit:$HOME/.bashrc:0:vim:xterm 
xdg-open plug-edit:$HOME/.bashrc:0:neovim:kitty 
```

```
# Test-run using plug_editor_launch
which plug_editor_launch 
plug_editor_launch plug-edit:$HOME/.bashrc:0:vscode 
plug_editor_launch plug-edit:$HOME/.bashrc:0:vim:xterm 
plug_editor_launch plug-edit:$HOME/.bashrc:0:neovim:kitty 
```

From the browser console: 

```
window.location.href = "plug-edit:/home/<yourid>/.bashrc:0:<youreditor>:<yourterminal>";
```

In an HTML doc: 

```
<a href="plug-edit:/home/<yourid>/.bashrc:0:<youreditor>:<yourterminal>">Launch Editor</a>
```

In the Phoenix development environment: follow the PhoenixLiveReload [directions][2].

## Support and Contributing

I wrote this for my own use & want to keep it simple.  You're welcome to copy,
extract & extend.  I can only debug issues on Xubuntu.  PRs welcome for Linux
& Mac.

## Reference 

xdg-utils 
- https://www.freedesktop.org/wiki/Software/xdg-utils/ 
- https://wiki.archlinux.org/title/Xdg-utils 

xdg-open 
- https://portland.freedesktop.org/doc/xdg-open.html 

xdg-mime 
- https://portland.freedesktop.org/doc/xdg-mime.html 

## Related Projects

- https://github.com/shengyou/vscode-handler

