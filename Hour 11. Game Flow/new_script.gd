extends Node

var label = Label.new()
var counter = 0


func _ready() -> void:
#	print(get_tree().get_current_scene())
#	get_tree().paused = true
#	print(get_tree().paused)
#	get_tree().reload_current_scene()
#	get_tree().auto_accept_quit = true
	label.text = str(0)
	$PauseMenu.dialog_text = "Paused"
	$PauseMenu.connect("confirmed", unpause)
	$PauseMenu.connect("canceled", unpause)
	$PauseMenu.mode = PROCESS_MODE_WHEN_PAUSED
	add_child(label)


func _process(delta: float) -> void:
	counter += delta
	label.text = "%.1f" % counter


func _input(event: InputEvent) -> void:
	if event is InputEventKey:
		if event.keycode == KEY_ESCAPE:
			$PauseMenu.popup()
			get_tree().paused = true


func unpause():
	get_tree().paused = false
