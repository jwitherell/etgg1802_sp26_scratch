extends CharacterBody2D

@export var target: Node2D     # none initially,
		# must be set externally
var move_speed = 30.0

func _process(delta):
	var Q: Vector2 = target.position - position
	var Qhat: Vector2 = Q.normalized()
	
	# This vector is how far I want to move 
	# in one second.
	var new_velocity: Vector2 = Qhat * move_speed

	# Note how we're changing a CharacterBody2D 
	# attribute here.  CharacterBody2D will use this
	# to move us when we move_and_slide
	velocity = new_velocity
	print(velocity)
	
	# THIS uses the velocity to actually move (and
	# slide along any collisions)
	move_and_slide()
