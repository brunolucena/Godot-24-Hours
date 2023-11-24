extends Node2D


func _ready() -> void:
	# Create a new directory object
	var dir = DirAccess.open("res://")

	if not dir:
		print("error: ", DirAccess.get_open_error())
		return

	dir.make_dir_recursive("./teste/abacate")

	# Start listing the directories
	dir.list_dir_begin()
	# Retrieve the first file or dir
	var name = dir.get_next()
	# Start a loop
	while name != "":
		# Test if it's a dir and print as appropriate
		if dir.current_is_dir():
			print("dir: ", name)
		else:
			print("file: ", name)
		name = dir.get_next()

	# End the listing
	dir.list_dir_end()


