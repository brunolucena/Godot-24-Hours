extends Label

var counter := 0


func _on_Sprite_exited_screen(sprite: Sprite) -> void:
	counter += 1
	text = "{counter} Sprite{plural} Spawned".format({
		'counter': counter,
		'plural': '' if counter == 1 else 's',
	})
