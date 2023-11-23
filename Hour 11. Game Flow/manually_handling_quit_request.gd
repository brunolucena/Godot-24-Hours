extends Node2D


var dialog = ConfirmationDialog.new()


func _ready() -> void:
	dialog.dialog_text = "Are you sure?"
	dialog.get_ok_button().text = "Yes"
	dialog.get_cancel_button().text = "No"
	dialog.connect("confirmed", end)
	add_child(dialog)
	get_tree().auto_accept_quit = false


func _notification(what: int) -> void:
	if what == NOTIFICATION_WM_CLOSE_REQUEST:
		dialog.popup_centered()


func end():
	get_tree().quit()
