lint:
	#!/bin/env sh
	bluebuild validate recipes/recipe-hyprland.yml
switch:
	#!/bin/env sh
	sudo bluebuild switch --tempdir ~/.cache/bluebuild recipes/recipe-hyprland.yml
