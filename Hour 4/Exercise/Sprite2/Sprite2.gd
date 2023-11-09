extends Sprite

signal sprite_exited_screen(spriteInstance)

const SPEED := 1000


func _process(delta: float) -> void:
	position.y += SPEED * delta

func _on_VisibilityNotifier2D_viewport_exited(viewport: Viewport) -> void:
	emit_signal("sprite_exited_screen", self)
	queue_free()

