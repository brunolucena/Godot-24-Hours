extends Node2D

var label
var clock = 0


func _ready() -> void:
	label = Label.new()
	add_child(label)
	ResourceLoader.load_threaded_request("sprite_2d.tscn")


func _process(delta: float) -> void:
	clock += delta
	var scene = ResourceLoader.load_threaded_get("sprite_2d.tscn")
	var status = ResourceLoader.load_threaded_get_status("sprite_2d.tscn")
	print(status)
	if scene:
		get_tree().change_scene_to_packed(scene)
