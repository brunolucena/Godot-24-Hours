extends Node2D


func _ready() -> void:
	read_file()


func read_file():
	var path = "user://save.dat"
	var file = FileAccess.open_encrypted_with_pass(path, FileAccess.READ, "my_password")
	var jsonFile = FileAccess.open("user://config.dat", FileAccess.READ)

	if not file:
		print("error: ", FileAccess.get_open_error())
		return

	var read = {}
	read.player_dictionary = file.get_var()
	read.player_name = file.get_var()
	read.player_score = file.get_float()
	read.json = JSON.parse_string(jsonFile.get_as_text())

	print("read ", read)

	return read
