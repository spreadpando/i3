#!/usr/bin/env bash

dir="$HOME/.config/polybar"
themes=(`ls --hide="launch.sh" $dir`)

# Function to create a temporary config file for a specific monitor
create_monitor_config() {
	local monitor=$1
	local has_tray=$2
	local style=$3
	
	# Create a temporary config file
	local temp_config=$(mktemp)
	
	# Copy the base config and modify it
	sed -e "s/^monitor = .*/monitor = $monitor/" \
		-e "s/^monitor-strict = .*/monitor-strict = true/" \
		-e "s/^tray-position = .*/tray-position = $has_tray/" \
		"$dir/$style/config.ini" > "$temp_config"
	
	echo "$temp_config"
}

launch_bar() {
	# Terminate already running bar instances
	killall -q polybar

	# Wait until the processes have been shut down
	while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

	# Get list of monitors
	MONITORS=($(xrandr --query | grep " connected" | cut -d" " -f1))
	
	echo "Available monitors: ${MONITORS[@]}"
	
	# Launch bars for each monitor
	for m in "${MONITORS[@]}"; do
		if [[ "$m" == "DP-0" ]]; then  # Always use DP-0 for tray (right monitor)
			echo "Launching polybar with tray on DP-0"
			config_file=$(create_monitor_config "$m" "right" "$style")
			MONITOR=$m polybar -q main -c "$config_file" &
		else
			echo "Launching polybar without tray on $m"
			config_file=$(create_monitor_config "$m" "none" "$style")
			MONITOR=$m polybar -q main -c "$config_file" &
		fi
	done
}

# Parse command line arguments
while [[ $# -gt 0 ]]; do
	case $1 in
		--material)
			style="material"
			launch_bar
			shift
			;;
		--shades)
			style="shades"
			launch_bar
			shift
			;;
		--hack)
			style="hack"
			launch_bar
			shift
			;;
		--docky)
			style="docky"
			launch_bar
			shift
			;;
		--cuts)
			style="cuts"
			launch_bar
			shift
			;;
		--shapes)
			style="shapes"
			launch_bar
			shift
			;;
		--grayblocks)
			style="grayblocks"
			launch_bar
			shift
			;;
		--blocks)
			style="blocks"
			launch_bar
			shift
			;;
		--colorblocks)
			style="colorblocks"
			launch_bar
			shift
			;;
		--forest)
			style="forest"
			launch_bar
			shift
			;;
		--pwidgets)
			style="pwidgets"
			launch_bar
			shift
			;;
		--panels)
			style="panels"
			launch_bar
			shift
			;;
		--pando)
			style="pando"
			launch_bar
			shift
			;;
		*)
			cat <<- EOF
			Usage : launch.sh --theme
			
			Available Themes :
			--blocks    --colorblocks    --cuts      --docky
			--forest    --grayblocks     --hack      --material
			--panels    --pwidgets       --shades    --shapes    --pando
			EOF
			exit 1
			;;
	esac
done
