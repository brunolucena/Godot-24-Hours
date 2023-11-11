extends Sprite


func _ready() -> void:
	$"%queue_free_timer".connect('timeout', self, 'queue_free')

