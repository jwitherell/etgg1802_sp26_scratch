extends CharacterBody2D

var move_speed = 50.0

func _ready():
	print("Hello!")
	
# This is called when any kind of input-related event
# happens.  Some things like gamepad plug-in event
# are only detectable this way.
#func _input(event):
#	if event is InputEventMouseButton:
#		position = event.position

func _process(delta):
	# This does the same thing as the _input function
	# above, just this one uses "abstract" actions
	if Input.is_action_just_pressed("the_click"):
		position = get_viewport().get_mouse_position()
	else:
		position.x += move_speed * delta
