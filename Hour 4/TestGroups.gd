extends Node2D


func _ready() -> void:
	get_tree().call_group("player", "im_calling_you")
