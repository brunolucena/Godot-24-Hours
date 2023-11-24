extends Node2D

# Some variables to store
var player_name = "Link"
var player_score = 550


func _ready() -> void:
	create_file()


func create_file():
	var path = "user://save.dat"
	# Create a new File object
	var file =  FileAccess.open_encrypted_with_pass(path, FileAccess.WRITE, "my_password")
	var jsonFile =  FileAccess.open("user://config.dat", FileAccess.WRITE)

	file.store_var({ "teste": 2 })
	file.store_var(player_name)
	file.store_float(player_score)
	jsonFile.store_string(JSON.stringify({
		"testing": 123,
		"abacate": "rosa",
		"check": true,
	}))

	file.close() # close() Can be ommited, as Godot will close automatically when file is out of scope
