extends Navigation2D


var start_point = Vector2()
var end_point = Vector2()
var path: PoolVector2Array = []

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.is_pressed():
		if event.button_index == BUTTON_LEFT:
			start_point = event.position
		elif event.button_index == BUTTON_RIGHT:
			end_point = event.position

	path = get_simple_path(start_point, end_point, false)
	update()

#func _process(delta: float) -> void:
#	path = get_simple_path(start_point, end_point, false)
#	update()

func _draw() -> void:
	for point in path:
		draw_circle(point, 10, Color(1, 1, 1))
		draw_polyline(path, Color(1, 0, 0), 3.0, true)
