extends Area2D

var SCREEN_WIDTH = ProjectSettings.get_setting('display/window/size/viewport_width')
@export var move_speed = 500.0

func _process(delta: float) -> void:
	position += Vector2(move_speed * delta, 0.0)

	if position.x >= SCREEN_WIDTH + 8:
		queue_free()


func _on_shot_area_entered(area: Area2D) -> void:
	if area.is_in_group("asteroid"):
		queue_free()
