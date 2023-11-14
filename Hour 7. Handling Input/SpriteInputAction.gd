extends Sprite

var action_move_up = InputEventAction.new()

# in _input callback
func _input(event: InputEvent) -> void:
	if event.is_action("move_up"):
		if event.is_pressed():
			print("start walking")
			get_tree().set_input_as_handled()
		else:
			print("stop walking")

# with Input Singleton
func _process(delta: float) -> void:
	if Input.is_action_pressed("move_up"):
		print("walk up")
	if Input.is_action_pressed("move_down"):
		print("walk down")

func _ready() -> void:
	InputMap.add_action("move_down")
	var event = InputEventKey.new()
	event.scancode = KEY_DOWN
	InputMap.action_add_event("move_down", event)
	for action in InputMap.get_actions():
		print('action', action)
		var list = InputMap.get_action_list(action)
		print(list)

	# auto move
	action_move_up.action = "move_up"
	action_move_up.pressed = true
	auto_move()

func auto_move():
	Input.parse_input_event(action_move_up)
#	Input.action_press("move_up") #  also works
