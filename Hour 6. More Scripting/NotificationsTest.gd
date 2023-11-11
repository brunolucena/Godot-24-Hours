extends Node


func _notification(what: int) -> void:
	if what == NOTIFICATION_WM_QUIT_REQUEST:
		get_tree().set_auto_accept_quit(false)
		print("I'm about to quit!")
		get_tree().quit()
		#propagate_call('quit', [1, 2, 3])
		#get_tree().call_group('test', 'quit', [1, 2, 3])

		return

func _ready() -> void:
	print(OS.clipboard)

