extends Node

func _input(event: InputEvent) -> void:
#	with echo
#	if event is InputEventKey:
#		var is_echo = "Echo" if event.echo else ""
#
#		if event.pressed:
#			print("Key pressed ", event.scancode, ", ", is_echo, " human readable string ", OS.get_scancode_string(event.scancode))
#		else:
#			print("Key released ", event.scancode, ", ", is_echo, " human readable string ", OS.get_scancode_string(event.scancode))

# 	without echo
	if event is InputEventKey and !event.echo:
		if event.pressed:
			print("Key pressed ", event.scancode, ", ", " human readable string ", OS.get_scancode_string(event.scancode))
		else:
			print("Key released ", event.scancode, ", ", " human readable string ", OS.get_scancode_string(event.scancode))

	if event is InputEventJoypadButton:
		print("Button: ", str(event.button_index), " ", "pressed" if event.pressed else "released")

func _process(delta: float) -> void:
#	handling keyboard button holding
	if Input.is_key_pressed(KEY_SPACE):
		print("Holding spacebar")
