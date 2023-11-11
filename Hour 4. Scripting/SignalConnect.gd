extends Node2D


func _ready() -> void:
	$Button.connect("pressed", self, "_on_Button_pressed", [$Button])

func _on_Button_pressed(arg1):
	print("Button got pressed", arg1)
