extends Node2D

var label = Label.new()


func _ready() -> void:
	label.text = "Press Start"
	add_child(label)


func _input(event: InputEvent) -> void:
	if event is InputEventKey:
		get_tree().change_scene_to_file("res://sprite_2d.tscn")
