extends KinematicBody2D

export var SPEED = 200


func _physics_process(delta: float) -> void:
	var velocity = Vector2(0, 0)

	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
	elif Input.is_action_pressed("ui_right"):
		velocity.x += 1

	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
	elif Input.is_action_pressed("ui_down"):
		velocity.y += 1

	var movement = velocity.normalized() * 200

	move_and_slide(movement)
