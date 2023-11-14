extends Sprite

export var SPEED = 100

func _process(delta: float) -> void:
	var direction = Vector2(0, 0)

	if Input.is_key_pressed(KEY_UP):
		direction.y -= 1
	if Input.is_key_pressed(KEY_DOWN):
		direction.y += 1
	if Input.is_key_pressed(KEY_LEFT):
		direction.x -= 1
	if Input.is_key_pressed(KEY_RIGHT):
		direction.x += 1

	direction = direction.normalized() # Make sure diagonal movement will be in the same speed
	direction *= SPEED * delta # Multiply by speed (pixels per second) and the time passed (seconds)

	translate(direction) # Move the Sprite by the direction vector
#	position += direction
