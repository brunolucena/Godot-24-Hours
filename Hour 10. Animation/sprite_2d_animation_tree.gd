extends Sprite2D

@onready var animation_player = $AnimationPlayer
@onready var animation_tree = $AnimationTree
@onready var animation_state = animation_tree.get("root_motion_track")

func _input(event: InputEvent) -> void:
	var velocity = Vector2()

	if event is InputEventKey:
		if event.pressed:
			if event.keycode == KEY_LEFT:
				velocity.x -= 1
				animation_tree.set("parameters/Transition/transition_request", "move_left")
			elif event.keycode == KEY_RIGHT:
				velocity.y -= 1
				animation_tree.set("parameters/Transition/transition_request", "move_right")

			if event.keycode == KEY_UP:
				velocity.x -= 1
				animation_tree.set("parameters/Transition/transition_request", "move_up")

	translate(velocity.normalized())


func finished_move_left():
#	animation_tree.set("parameters/Transition/transition_request", "move_right")
	pass


func finished_move_right():
	pass
#	animation_tree.set("parameters/Transition/transition_request", "move_left")
