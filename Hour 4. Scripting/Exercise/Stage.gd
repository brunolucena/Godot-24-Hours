extends Node2D

var Sprite = load("res://Exercise/Sprite/Sprite.tscn")
var Sprite2 = load("res://Exercise/Sprite2/Sprite2.tscn")

func _on_SpawnButton_pressed() -> void:
	var spriteInstance = Sprite.instance()
	spriteInstance.position = Vector2(500, -spriteInstance.texture.get_height())
	add_child(spriteInstance)

	spriteInstance.connect("sprite_exited_screen", $SpawnCounter, "_on_Sprite_exited_screen")


func _on_SpawnButton2_pressed() -> void:
	var sprite2Instance = Sprite2.instance()
	sprite2Instance.position = Vector2(800, -sprite2Instance.texture.get_height())
	add_child(sprite2Instance)

	sprite2Instance.connect("sprite_exited_screen", $SpawnCounter, "_on_Sprite_exited_screen")
