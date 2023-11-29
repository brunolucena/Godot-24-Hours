extends Sprite2D

var SCREEN_WIDTH = ProjectSettings.get_setting('display/window/size/viewport_width')
@export var scroll_speed = 30.0

func _process(delta: float) -> void:
	position += Vector2(-scroll_speed * delta, 0.0)

	if position.x <= -SCREEN_WIDTH:
		position.x += SCREEN_WIDTH
