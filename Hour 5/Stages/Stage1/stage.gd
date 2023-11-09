extends Node2D

var asteroid_scene = preload("res://Components/Asteroid/asteroid.tscn")
var SCREEN_WIDTH = ProjectSettings.get_setting('display/window/size/width')
var SCREEN_HEIGHT = ProjectSettings.get_setting('display/window/size/height')

var is_game_over = false
var level = 1
var score = 0

func _ready() -> void:
	randomize()
	$player.connect("destroyed", self, "_on_player_destroyed")

func _input(event: InputEvent) -> void:
	if Input.is_key_pressed(KEY_ESCAPE):
		get_tree().quit()

	if is_game_over and Input.is_key_pressed(KEY_ENTER):
		get_tree().change_scene("res://Stages/Stage1/stage.tscn")

func _on_player_destroyed() -> void:
	$ui.show_retry()
	$ui.stop_timer()
	is_game_over = true

func _on_spawn_timer_timeout() -> void:
	var asteroids_count = floor((level + 5) / 5)

	for i in range(0, asteroids_count):
		add_asteroid()

func _on_player_score():
	score += 1
	$ui.update_score(score)

func _on_next_level_timer_timeout() -> void:
	level += 1
	$ui.change_level(level)
	$background.scroll_speed += $background.scroll_speed * 0.2
	$spawn_timer.wait_time = $spawn_timer.wait_time * 0.99

func add_asteroid():
	var asteroid_instance2 = asteroid_scene.instance()
	asteroid_instance2.position = Vector2(SCREEN_WIDTH + 8, rand_range(0, SCREEN_HEIGHT))
	asteroid_instance2.connect("score", self, "_on_player_score")
	asteroid_instance2.set_move_speed(level)

	add_child(asteroid_instance2)
