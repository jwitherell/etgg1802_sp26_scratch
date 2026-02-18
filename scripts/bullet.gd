extends Area2D

func _process(delta):
	#position.x += 100 * delta
	#translate(Vector2(100 * delta, 0))
	position += transform.x * (100 * delta)
