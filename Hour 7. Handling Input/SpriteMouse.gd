extends Sprite

# using _input callback
#func _input(event: InputEvent) -> void:
#	if event is InputEventMouseButton:
#		if event.is_pressed():
#			prints("Button ", event.button_index, " is pressed at", str(event.position))
#		else:
#			prints("Button ", event.button_index, " is released at", str(event.position))
#
#	if event is InputEventMouseMotion:
#		print(event.position)
#		position = event.position

# using Input singletion
func _process(delta: float) -> void:
	if Input.is_mouse_button_pressed(BUTTON_LEFT):
		print("Holding left mouse button at ", get_tree().get_root().get_mouse_position())
		position = get_tree().get_root().get_mouse_position()
