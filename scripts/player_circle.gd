extends CharacterBody2D

var move_speed: float = 50.0

@export var bullet_scene: PackedScene = preload("res://scenes/bullet.tscn")

var bullet_container: Node2D

func _ready():
	print("Hello!")
	bullet_container = get_node("/root/world_root/bullet_container")
	
# This is called when any kind of input-related event
# happens.  Some things like gamepad plug-in event
# are only detectable this way.
#func _input(event):
#	if event is InputEventMouseButton:
#		position = event.position

func _process(delta):
	var mouse_pos: Vector2 = get_global_mouse_position()
	var adjacent: float = mouse_pos.x - global_position.x
	var opposite: float = mouse_pos.y - global_position.y
	rotation = atan2(opposite, adjacent)
	#get_node("pivot_node").rotation_degrees += 50 * delta
	
	# This does the same thing as the _input function
	# above, just this one uses "abstract" actions
	if Input.is_action_just_pressed("the_click"):
		position = get_viewport().get_mouse_position()
	#else:
	#	position.x += move_speed * delta
		
		
	if Input.is_action_just_pressed("fire"):
		var new_bullet = bullet_scene.instantiate()
		#add_child(new_bullet)
		#var aim_node: Node2D = get_node("pivot_node/aim_spot")
		var aim_node: Node2D = $pivot_node/aim_spot
		bullet_container.add_child(new_bullet)
		# Make sure to adjust positions/rotations AFTER adding
		#new_bullet.global_position = global_position
		new_bullet.global_position = aim_node.global_position
		new_bullet.rotation = rotation
