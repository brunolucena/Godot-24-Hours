extends Node2D

signal test_signal(some_argument, another_argument)

func _ready() -> void:
	emit_signal("test_signal", "test", 123)
