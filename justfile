lint:
	#!/bin/sh
	bluebuild validate recipes/recipe-hyprland.yml
switch:
	#!/bin/sh
	sudo bluebuild switch --tempdir ~/.cache/bluebuild recipes/recipe-hyprland.yml
