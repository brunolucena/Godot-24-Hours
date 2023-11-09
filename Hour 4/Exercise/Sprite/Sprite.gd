extends Sprite

signal sprite_exited_screen(spriteInstance)

const SPEED := 1000
var SCREEN_HEIGHT: int = ProjectSettings.get_setting("display/window/size/height")


func _ready() -> void:
	self.connect("sprite_exited_screen", self, '_on_Sprite_exited_screen')

func _process(delta: float) -> void:
	position.y += SPEED * delta

	if position.y > SCREEN_HEIGHT:
		emit_signal("sprite_exited_screen", self)

func _on_Sprite_exited_screen(instance: Sprite) -> void:
	instance.queue_free()
