extends ColorRect


func _gui_input(event: InputEvent) -> void:
	if event is InputEventMouse:
		var v = event.position/size
		color = Color(v.x, v.y, 1, 1)
