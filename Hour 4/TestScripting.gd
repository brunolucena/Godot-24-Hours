extends Sprite


export var movement_speed = 50

var input_direction = 0

func _process(delta: float) -> void:
	position.x += input_direction * movement_speed * delta

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_left"):
		input_direction = -1
	elif event.is_action_pressed("ui_right"):
		input_direction = 1
	elif event.is_action_released("ui_left"):
		input_direction = 0
	elif event.is_action_released("ui_right"):
		input_direction = 0

# Movement using _process. In this case, it's not ideal because it's much more
# likely that an input is not pressed that it is pressed, so checking it in
# every frame is a waste of resources. A better way is to check in _input
# virtual method.
#func _process(delta: float) -> void:
#	var input_direction = 0
#
#	if Input.is_action_pressed("ui_left"):
#		input_direction = -1
#	elif Input.is_action_pressed("ui_right"):
#		input_direction = 1
#
#	position.x += input_direction * MOVEMENT_SPEED * delta

