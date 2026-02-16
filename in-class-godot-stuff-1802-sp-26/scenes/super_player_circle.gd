# This is a new script that INHERITS from player_circle
# (gets all the base-class attributes and methods)
extends "res://scripts/player_circle.gd"

var speed_boost_on = false


func _on_timer_timeout() -> void:
	speed_boost_on = not speed_boost_on
	if speed_boost_on:
		move_speed *= 2	   # Note this variable
					# was defined and being used in
					# the player_circle class...we're
					# just modifying it here.
	else:
		move_speed /= 2
		
func _process(delta):
	# Since we made our own _process method, we MASK
	# what was inherited.  If we want, we can still 
	# access it, though, like this.
	super._process(delta)
	
	# Now do the unique thing WE do in super-player
	position.y += 10 * delta
