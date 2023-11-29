extends Sprite2D


func _ready() -> void:
	$"%queue_free_timer".connect('timeout', Callable(self, 'queue_free'))

