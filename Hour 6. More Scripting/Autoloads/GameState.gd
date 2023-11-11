extends Node

signal points_added(current_points, points_added)

var points = 0

func add_points(points_added: int) -> void:
	points += points_added
	emit_signal("points_added", points, points_added)
