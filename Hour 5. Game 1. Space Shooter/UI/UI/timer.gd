extends Label

var time := 0.0
var running = true

func _process(delta: float) -> void:
	if running:
		time += delta

		var seconds = fmod(time, 60)
		var minutes = fmod(time, 60 * 60) / 60

		text = "%02d:%02d" % [minutes, seconds]
