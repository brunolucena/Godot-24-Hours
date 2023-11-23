extends Sprite2D

@onready var animation_player = $AnimationPlayer
@onready var animation_playback = animation_player.get_pro

var paused = false


func _ready() -> void:
	animation_player.connect("animation_finished", on_animation_finished)


func _input(event: InputEvent) -> void:
	if event is InputEventKey:
		if (
				event.keycode == KEY_UP
				and not event.pressed
				and not paused
				and (!animation_player.is_playing() or animation_player.current_animation != "animations/bounce")
		):
			animation_player.play("animations/bounce")
		if event.keycode == KEY_S and event.pressed:
			if animation_player.is_playing():
				animation_player.pause()
				paused = true
			elif paused:
				animation_player.play()
				paused = false


func on_animation_finished(anim_name: StringName):
	print("animation finished ", anim_name)
	paused = false


func wood_chop():
	print("wood chop")
