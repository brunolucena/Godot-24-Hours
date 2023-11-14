extends Sprite

export var SPEED = 100
var device_index = 0

func _ready() -> void:
	Input.connect("joy_connection_changed", self, "joy_connect")

func joy_connect(index, connect):
	# When a joystick is detected, keep the device index in a variable
	if connect:
		device_index = index
		print("device connected: ", device_index)

func _process(delta: float) -> void:
	var direction = Vector2(0, 0)

	# Query Input singleton with the device index
	if Input.is_joy_button_pressed(device_index, 12):
		direction.y -= 1
	if Input.is_joy_button_pressed(device_index, 13):
		direction.y += 1
	if Input.is_joy_button_pressed(device_index, 14):
		direction.x -= 1
	if Input.is_joy_button_pressed(device_index, 15):
		direction.x += 1

	direction = direction.normalized()
	direction *= SPEED * delta
	translate(direction)
