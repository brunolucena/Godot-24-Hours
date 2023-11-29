extends Area2D

@export var move_speed := 150.0

var SCREEN_WIDTH = ProjectSettings.get_setting('display/window/size/viewport_width')
var SCREEN_HEIGHT = ProjectSettings.get_setting('display/window/size/viewport_height')

var SPRITE_HEIGHT = 16
var SPRITE_WIDTH = 16

var explostion_scene = preload("res://Components/Explosion/explosion.tscn")
var shot_scene = preload("res://Components/Shot/shot.tscn")

var can_shoot = true

signal destroyed

func getBoundaries():
	var leftBoundaries = 0.0 + (SPRITE_WIDTH / 2)
	var rightBoundaries = SCREEN_WIDTH - (SPRITE_WIDTH / 2)
	var topBoundaries = 0.0 + (SPRITE_HEIGHT / 2)
	var bottomBoundaries = SCREEN_HEIGHT - (SPRITE_HEIGHT / 2)

	return {
		'leftBoundaries': leftBoundaries,
		'rightBoundaries': rightBoundaries,
		'topBoundaries': topBoundaries,
		'bottomBoundaries': bottomBoundaries
	}

func _process(delta: float) -> void:
	var input_dir = Vector2()

	if Input.is_key_pressed(KEY_UP):
		input_dir.y -= 1
	if Input.is_key_pressed(KEY_DOWN):
		input_dir.y += 1
	if Input.is_key_pressed(KEY_LEFT):
		input_dir.x -= 1
	if Input.is_key_pressed(KEY_RIGHT):
		input_dir.x += 1

	position += delta * move_speed * input_dir.normalized()

	var boundaries = getBoundaries()

	if position.x < boundaries.leftBoundaries:
		position.x = boundaries.topBoundaries
	elif position.x > boundaries.rightBoundaries:
		position.x = boundaries.rightBoundaries

	if position.y < boundaries.topBoundaries:
		position.y = boundaries.topBoundaries
	elif position.y > boundaries.bottomBoundaries:
		position.y = boundaries.bottomBoundaries

	if Input.is_key_pressed(KEY_SPACE) and can_shoot:
		can_shoot = false
		$reload_timer.start()

		var stage_node = get_tree().current_scene
		var shot_instance1 = shot_scene.instantiate()
		var shot_instance2 = shot_scene.instantiate()

		shot_instance1.position = position + Vector2(9, -5)
		shot_instance2.position = position + Vector2(9, 5)

		stage_node.add_child(shot_instance1)
		stage_node.add_child(shot_instance2)


func _on_reload_timer_timeout() -> void:
	can_shoot = true


func _on_player_area_entered(area: Area2D) -> void:
	if area.is_in_group("asteroid"):
		var explosion_instance = explostion_scene.instantiate()
		explosion_instance.position = position

		var stage_node = get_tree().root
		stage_node.add_child(explosion_instance)

		queue_free()
		emit_signal("destroyed")

