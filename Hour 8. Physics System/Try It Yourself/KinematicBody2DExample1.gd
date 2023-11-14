extends KinematicBody2D

export (float) var speed = 100.0

func _physics_process(delta: float) -> void:
	var direction = Vector2()

	if Input.is_action_pressed("ui_left"):
		direction.x -= 1
	elif Input.is_action_pressed("ui_right"):
		direction.x += 1

	if Input.is_action_pressed("ui_up"):
		direction.y -= 1
	elif Input.is_action_pressed("ui_down"):
		direction.y += 1

	var movement = direction.normalized() * speed

	move_and_slide(movement)
