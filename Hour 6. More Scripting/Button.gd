extends Button

export var points_to_add = 1

func _ready() -> void:
	text = "Add %s Point%s" % [points_to_add, '' if points_to_add == 1 else 's']

func _on_Button_pressed() -> void:
	GameState.add_points(points_to_add)
	points_to_add += round(points_to_add / 2)
	text = "Add %s Point%s" % [points_to_add, '' if points_to_add == 1 else 's']
