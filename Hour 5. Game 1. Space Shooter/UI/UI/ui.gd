extends CanvasLayer

func _input(event: InputEvent) -> void:
	if Input.is_key_pressed(KEY_ESCAPE):
		get_tree().quit()

func update_score(score: int):
	$score.text = "Score: {score}".format({ 'score': score })

func show_retry():
	$retry.show()

func change_level(level: int):
	$level.text = "LEVEL %s" % level

func stop_timer():
	$timer.running = false
