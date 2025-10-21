# lint the recipes
lint:
	#!/bin/env sh
	bluebuild validate recipes/recipe-hyprland.yml

# build and switch to recipe-hyprland
switch:
	#!/bin/env sh
	sudo bluebuild switch --tempdir ~/.cache/bluebuild recipes/recipe-hyprland.yml

# build recipe-hyprland
build:
  sudo bluebuild build --tempdir ~/.cache/bluebuild recipes/recipe-hyprland.yml

# create symlinks from project dir to user config dir
link:
  #!/bin/env sh
  project_root=`pwd`
  if [ ! -d ~/.config/hypr ]
  then
    mkdir ~/.config/hypr
    ln -s $project_root/files/system/hyprland/usr/share/hyprland/hyprland.conf ~/.config/hypr/hyprland.conf
  fi
  if [ ! -f ~/.config/wlogout ]
  then
    ln -s $project_root/files/system/hyprland/etc/wlogout ~/.config/wlogout 
  fi
