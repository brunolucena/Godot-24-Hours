extends Node2D

var speed = 10

var damage = 10

var velocity = Vector2(0, 0)
var max_speed = 100

func _process(delta) -> void:
	if Input.is_action_pressed("ui_right"):
		if velocity.x < max_speed:
			velocity.x += 1
	elif Input.is_action_pressed("ui_left"):
		velocity.x -= 1

	position.x += velocity.x * speed * delta
