lint:
	#!/bin/env sh
	bluebuild validate recipes/recipe-hyprland.yml
switch:
	#!/bin/env sh
	sudo bluebuild switch --tempdir ~/.cache/bluebuild recipes/recipe-hyprland.yml

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
