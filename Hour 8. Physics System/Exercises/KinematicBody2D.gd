extends KinematicBody2D

export var SPEED = 200
export var acceleration = 7

onready var nav = $NavigationAgent2D

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.is_pressed():
		nav.set_target_location(event.position)

func _physics_process(delta: float) -> void:
	if nav.is_navigation_finished():
		return

	var target_pos = nav.get_next_location()
	var direction = global_position.direction_to(target_pos)
	var velocity = direction * nav.max_speed

	nav.set_velocity(velocity)


func _on_NavigationAgent2D_velocity_computed(safe_velocity: Vector2) -> void:
	move_and_slide(safe_velocity)

