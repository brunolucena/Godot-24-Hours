extends RayCast2D


func _process(delta: float) -> void:
	if is_colliding():
		var collider = get_collider()
		print({'collider': collider, 'class': collider.get_class()})
		if collider is KinematicBody2D:
			print("is KinematicBody2D")
			if collider.is_in_group('player'):
				collider.position = get_global_mouse_position()

	var space_state = get_world_2d().get_direct_space_state()
	var collisions = space_state.intersect_ray(Vector2(0, 0), Vector2(400, 400))
	$"../Line2D".points = [Vector2(0, 0), Vector2(400, 400), Vector2(400, 200)]
	print("collisions ", collisions)
