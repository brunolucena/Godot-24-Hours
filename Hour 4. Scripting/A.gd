extends Node2D


func _ready():
	# the following are equivalent
	get_node("../B").test_method("Hello from A")
	$"../B".test_method("This is a test.")

	get_node("%B").test_method("Another hello from A")
	$"%B".test_method("And again")
