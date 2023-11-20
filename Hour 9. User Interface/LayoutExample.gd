extends Control


func _ready() -> void:
	var _c = $HBoxContainer/Button.connect("pressed", Callable(self, "button_pressed"))
	var _c2 = $HBoxContainer/LineEdit.connect("text_submitted", Callable(self, "show_dialog"))

func show_dialog(name: String) -> void:
	if name == "":
		name = "anonymous"
	$AcceptDialog.dialog_text = "You are %s." % name
	$AcceptDialog.popup_centered_ratio()

func button_pressed():
	show_dialog($HBoxContainer/LineEdit.text)

