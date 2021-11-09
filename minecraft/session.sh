#!/bin/bash
#wget -q -O /home/ubuntu/minecraft/paperclip.jar https://papermc.io/api/v1/paper/1.16.2/latest/download

basedir=/home/ubuntu/minecraft

#command='java -Xms128M -Xmx3000M -XX:+UseG1GC -XX:+UnlockExperimentalVMOptions -XX:MaxGCPauseMillis=100 -XX:+DisableExplicitGC -XX:TargetSurvivorRatio=90 -XX:G1NewSizePercent=50 -XX:G1MaxNewSizePercent=80 -XX:G1MixedGCLiveThresholdPercent=35 -XX:+AlwaysPreTouch -XX:+ParallelRefProcEnabled -Dusing.aikars.flags=mcflags.emc.gs paperclip.jar nogui'

#command='java -Xms128M -Xmx3000M -XX:+UseG1GC -XX:+ParallelRefProcEnabled -XX:MaxGCPauseMillis=200 -XX:+UnlockExperimentalVMOptions -XX:+DisableExplicitGC -XX:+AlwaysPreTouch -XX:G1NewSizePercent=30 -XX:G1MaxNewSizePercent=40 -XX:G1HeapRegionSize=8M -XX:G1ReservePercent=20 -XX:G1HeapWastePercent=5 -XX:G1MixedGCCountTarget=4 -XX:InitiatingHeapOccupancyPercent=15 -XX:G1MixedGCLiveThresholdPercent=90 -XX:G1RSetUpdatingPauseTimePercent=5 -XX:SurvivorRatio=32 -XX:+PerfDisableSharedMem -XX:MaxTenuringThreshold=1 -Dusing.aikars.flags=https://mcflags.emc.gs -Daikars.new.flags=true -jar paperclip.jar nogui'

command='java -Xms400M -Xmx3000M paperclip.jar nogui'

start() {
	echo "Starting server..."
	bash -c "tmux new-session -d -c $basedir -s minecraft $command"
	echo "Server started"
}

stop() {
	echo "Stopping SSH-tunnel..."
	kill $pid
	echo "SSH-tunnel stopped"
	echo "Stopping server..."
	tmux send-keys -t minecraft "stop" C-m
	echo "Server stopped"
}

config() {
	# Configure paper.yml options
	if [ -f "paper.yml" ]; then
		# early-warning-delay, early-warning-every
		# Disables constant error spam of chunk unloading warnings
		sed -i "s/early-warning-delay: 10000/early-warning-delay: 120000/g" $basedir/paper.yml
		sed -i "s/early-warning-every: 5000/early-warning-every: 60000/g" $basedir/paper.yml
		# optimize-explosions
		# Paper applies a custom and far more efficient algorithm for explosions. It has no impact on gameplay.
		sed -i "s/optimize-explosions: false/optimize-explosions: true/g" $basedir/paper.yml
		# mob-spawner-tick-rate
		# This is the delay (in ticks) before an activated spawner attempts to spawn mobs.
		# Doubling the rate to 2 should have no impact on spawn rates. 
		# Only go higher if you have severe load from ticking spawners. Keep below 10.
		sed -i "s/mob-spawner-tick-rate: 1/mob-spawner-tick-rate: 3/g" $basedir/paper.yml
		# container-update-tick-rate
		# This changes how often your containers/inventories are refreshed while open. Do not go higher than 3.
		sed -i "s/container-update-tick-rate: 1/container-update-tick-rate: 2/g" $basedir/paper.yml
		# max-entity-collisions
		# Crammed entities (grinders, farms, etc.) will collide less and consume less TPS in the process.
		sed -i "s/max-entity-collisions: 8/max-entity-collisions: 2/g" $basedir/paper.yml
		# fire-physics-event-for-redstone
		# This stops active redstone from firing BlockPhysicsEvent and can salvage some TPS from a cosmetic task.
		# Note: If you have a rare plugin that listens to BlockPhysicsEvent, leave this on.
		sed -i "s/fire-physics-event-for-redstone: true/fire-physics-event-for-redstone: false/g" $basedir/paper.yml
		# use-faster-eigencraft-redstone
		# This setting eliminates redundant redstone updates by as much as 95% without breaking vanilla mechanics/devices (pretty sure).
		# Empirical testing shows a speedup by as much as 10x!
		sed -i "s/use-faster-eigencraft-redstone: false/use-faster-eigencraft-redstone: true/g" $basedir/paper.yml
		# grass-spread-tick
		# The time (in ticks) before the server attempts to spread grass in loaded chunks. This will have minimal gameplay impact on most game types.
		sed -i "s/grass-spread-tick-rate: 1/grass-spread-tick-rate: 3/g" $basedir/paper.yml
		# despawn-ranges 
		# Soft = The distance (in blocks) from a player where mobs will be periodically removed.
		# Hard = Distance where mobs will be removed instantly.
		sed -i "s/soft: 32/soft: 28/g" $basedir/paper.yml
		sed -i "s/hard: 128/hard: 96/g" $basedir/paper.yml
		# hopper.disable-move-event
		# This will significantly reduce hopper lag by preventing InventoryMoveItemEvent being called for EVERY slot in a container.
		# Warning: If you have a plugin that listens to InventoryMoveItemEvent, do not set true.
		sed -i "s/hopper.disable-move-event: false/hopper.disable-move-event: true/g" $basedir/paper.yml
		# non-player-arrow-despawn-rate, creative-arrow-despawn-rate
		# Similar to arrow-despawn-rate in Spigot, but targets skeleton arrows.
		# Since players cannot retrieve mob-fired arrows, this setting is only a cosmetic change.
		sed -i "s/creative-arrow-despawn-rate: -1/creative-arrow-despawn-rate: 60/g" $basedir/paper.yml
		sed -i "s/non-player-arrow-despawn-rate: -1/non-player-arrow-despawn-rate: 60/g" $basedir/paper.yml
		# prevent-moving-into-unloaded-chunks
		# Prevents players from entering an unloaded chunk (due to lag), which causes more TPS loss.
		# The true setting will rubberband them back to a "safe" area.
		# Note: If you did not pregenerate your world (what's wrong with you?!), this setting might be a godsend.
		sed -i "s/prevent-moving-into-unloaded-chunks: false/prevent-moving-into-unloaded-chunks: true/g" $basedir/paper.yml
		# disable-chest-cat-detection
		# By default, chests scan for a cat/ocelot on top of it when opened.
		# While this eliminates a vanilla mechanic (cats block chest opening), do you really need this silly mechanic?
		sed -i "s/disable-chest-cat-detection: false/disable-chest-cat-detection: true/g" $basedir/paper.yml
		# bungee-online-mode
		# disable Bungee online mode
		sed -i "s/bungee-online-mode: true/bungee-online-mode: false/g" $basedir/paper.yml
		# keep-spawn-loaded, keep-spawn-loaded-range
		# This causes the nether and the end to be ticked and save so we are going to disable it
		# This setting makes sense on high player count servers but for the Pi it just wastes resources
		sed -i "s/keep-spawn-loaded: true/keep-spawn-loaded: false/g" $basedir/paper.yml
		sed -i "s/keep-spawn-loaded-range: 10/keep-spawn-loaded-range: -1/g" $basedir/paper.yml
	fi
	# Configure bukkit.yml options
	if [ -f "bukkit.yml" ]; then
		# monster-spawns
		# This dictates how often (in ticks) the server will attempt to spawn a monster in a legal location.
		# Doubling the time between attempts helps performance without hurting spawn rates. 
		sed -i "s/monster-spawns: 1/monster-spawns: 2/g" $basedir/bukkit.yml
		# autosave
		# This enables Bukkit's world saving function and how often it runs (in ticks). It should be 6000 (5 minutes) by default.
		# This is causing 10 second lag spikes in 1.14 so we are going to increase it to 18000 (15 minutes).
		sed -i "s/autosave: 6000/autosave: 18000/g" $basedir/bukkit.yml
		# warn-on-overload
		# Disables annoying server is overloaded messages
		sed -i "s/warn-on-overload: true/warn-on-overload: false/g" $basedir/bukkit.yml
	fi
	# Configure spigot.yml options
	if [ -f "spigot.yml" ]; then
		# Merging items has a huge impact on tick consumption for ground items.
		# Higher values allow more items to be swept into piles and allow you to avoid plugins like ClearLag.
		# Note: Merging items will lead to the occasional illusion of items disappearing as they merge together a few blocks away. A minor annoyance.
		sed -i "s/exp: 3.0/exp: 6.0/g" $basedir/spigot.yml
		sed -i "s/item: 2.5/item: 4.0/g" $basedir/spigot.yml
		# max-entity-collisions
		# Crammed entities (grinders, farms, etc.) will collide less and consume less TPS in the process.
		sed -i "s/max-entity-collisions: 8/max-entity-collisions: 2/g" $basedir/spigot.yml
		# mob-spawn-range
		# Crammed entities (grinders, farms, etc.) will collide less and consume less TPS in the process.
		sed -i "s/mob-spawn-range: 8/mob-spawn-range: 6/g" $basedir/spigot.yml
		# entity-activation-range:
		sed -i -z "s/entity-activation-range:\n      animals: 32\n      monsters: 32\n      raiders: 48\n      misc: 16\n      \
			tick-inactive-villagers: true/entity-activation-range:\n      animals: 24\n      monsters: 24\n      raiders: 48\n      \
			misc: 12\n      tick-inactive-villagers: false/g" $basedir/spigot.yml
	fi
	# Configure server.properties options
	if [ -f "server.properties" ]; then
		# Configure server.properties
		# network-compression-threshold
		# This option caps the size of a packet before the server attempts to compress it.
		# Setting it higher can save some resources at the cost of more bandwidth, setting it to -1 disables it.
		# Note: If your server is in a network with the proxy on localhost or the same datacenter (<2 ms ping), disabling this (-1) will be beneficial.
		sed -i "s/network-compression-threshold=256/network-compression-threshold=512/g" $basedir/server.properties
		# Disable Spawn protection
		sed -i "s/spawn-protection=16/spawn-protection=0/g" $basedir/server.properties
		# Disable snooper
		sed -i "s/snooper-enabled=true/snooper-enabled=false/g" $basedir/server.properties
		# Increase server watchdog timer to prevent it from shutting itself down without restarting
		sed -i "s/max-tick-time=60000/max-tick-time=120000/g" $basedir/server.properties
	fi
}

update() {
	echo "Updating to most recent paperclip version ..."
	# Test internet connectivity first
	curl -H "Accept-Encoding: identity" -H "Accept-Language: en" \
		-L -A "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4.212 Safari/537.36" \
		-s google.com -o /dev/null
	if [ "$?" != 0 ]; then
		echo "Unable to connect to update website (internet connection may be down).  Skipping update ..."
	else
		# Get latest build
		BuildJSON=$(curl -H "Accept-Encoding: identity" -H "Accept-Language: en" \
			-L -A "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4.212 Safari/537.36" \
			https://papermc.io/api/v2/projects/paper/versions/verselect)
		Build=$(echo "$BuildJSON" | rev | cut -d, -f 1 | cut -d] -f 2 | rev)
		Build=$(($Build + 0))
		if [[ $Build != 0 ]]; then
			echo "Latest paperclip build found: $Build"
			curl -H "Accept-Encoding: identity" -H "Accept-Language: en" \
				-L -A "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4.212 Safari/537.36" \
				-o $basedir/paperclip.jar \
				"https://papermc.io/api/v2/projects/paper/versions/verselect/builds/$Build/downloads/paper-verselect-$Build.jar"
		else
			echo "Unable to retrieve latest Paper build (got result of $Build)"
		fi
	fi
}

case "$1" in

start)
	start ;;
stop)
	stop ;;
config)
	config ;;
update)
	update ;;
attach)
	tmux attach -t minecraft ;;
restart)
	stop
	sleep 0.8
	sudo /sbin/reboot ;;
temp)
	cat /sys/class/thermal/thermal_zone0/temp ;;

*)
echo "Usage: start.sh (start|stop|restart|attach)" ;;

esac
