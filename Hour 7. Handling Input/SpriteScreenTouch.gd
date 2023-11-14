extends Sprite


func _input(event: InputEvent) -> void:
	if event is InputEventScreenTouch and event.is_pressed():
		print("Screen touch at ", str(event.position))
		position = event.position

	if event is InputEventScreenDrag:
		print("Screen drag at ", event.position)
		position = event.position
