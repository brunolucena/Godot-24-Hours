extends HSlider


@onready var audio_stream = $AudioStreamPlayer
@onready var timer = $Timer

var length_in_seconds = 0
var playing = false
var position_in_miliseconds = 0

func _ready() -> void:
	length_in_seconds = audio_stream.stream.get_length()


func _on_timer_timeout() -> void:
	position_in_miliseconds += 0.1
	var seconds = fmod(position_in_miliseconds, 60)
	var minutes = fmod(position_in_miliseconds, 60 * 60) / 60
	$"../CurrentTime".text = "%02d:%02d" % [minutes, seconds]
	print("%02d:%02d" % [minutes, seconds])
	set_percentage_value()


func _on_play_pause_pressed() -> void:
	playing = !playing

	if playing:
		play()
	else:
		pause()


func play():
	var seconds = fmod(position_in_miliseconds, 60)
	audio_stream.play(seconds)
	audio_stream.stream_paused = false
	timer.start()
	timer.paused = false


func pause():
	position_in_miliseconds = audio_stream.get_playback_position()
	audio_stream.stream_paused = true
	timer.paused = true


func set_percentage_value():
	var percentage = position_in_miliseconds * 100 / length_in_seconds
	value = percentage


func _on_value_changed(value: float) -> void:
	pause()

	var next_position = value * length_in_seconds / 100
	audio_stream.play(next_position)

	timer.paused = false


func _on_volume_value_changed(value: float) -> void:
	audio_stream.volume_db = value - 76
