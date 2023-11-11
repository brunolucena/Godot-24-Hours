extends Label


func _ready() -> void:
	var _connect = GameState.connect("points_added", self, "_on_GameState_points_added")

func _on_GameState_points_added(current_points, points_added) -> void:
	print("Added ", points_added, " points")

	text = "You have {points} point{plural}".format({
		"points": current_points,
		"plural": '' if current_points == 1 else 's'
	})
