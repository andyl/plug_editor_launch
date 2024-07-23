#!/usr/bin/env bash 

echo "PLUG_EDITOR_LAUNCH INSTALL"

REPO_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
DESK_DIR="$(realpath ~/.local/share/applications)"
DESKTOP="plug-edit.desktop"
LAUNCHER="plug_editor_launch"

echo "Symlink /usr/local/bin/$LAUNCHER" 
sudo ln -fs $REPO_PATH/$LAUNCHER /usr/local/bin/$LAUNCHER

echo "Symlink $DESK_DIR/$DESKTOP"
ln -fs $REPO_PATH/$DESKTOP $DESK_DIR/$DESKTOP

echo "Update MIME database"
update-desktop-database $DESK_DIR

echo "Done."
