extends KinematicBody2D
class_name Player

export var ACCELERATION = 3000
export var MAX_SPEED = 500
export var ROLL_SPEED = 120
export var FRICTION = 500

enum {
	MOVE,
	ROLL,
	ATTACK
}

var state = MOVE
var velocity = Vector2.ZERO
var roll_vector = Vector2.DOWN
var stats = PlayerStats

onready var animation_tree = $"%AnimationTree"
onready var animation_state = animation_tree.get('parameters/playback')
onready var sword_hitbox = $HitboxPivot/SwordHitbox
onready var hurtbox = $Hurtbox


func _ready() -> void:
	stats.connect("no_health", self, "queue_free")
	animation_tree.active = true
	animation_state.travel("Idle")
	sword_hitbox.knockback_vector = Vector2.DOWN

func _physics_process(delta: float):
	match state:
		MOVE:
			move_state(delta)
		ROLL:
			roll_state(delta)
		ATTACK:
			attack_state(delta)

func move_state(delta: float):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()

	if input_vector != Vector2.ZERO:
		roll_vector = input_vector
		sword_hitbox.knockback_vector = input_vector
		animation_tree.set('parameters/Idle/blend_position', input_vector)
		animation_tree.set('parameters/Run/blend_position', input_vector)
		animation_tree.set('parameters/Attack/blend_position', input_vector)
		animation_tree.set('parameters/Roll/blend_position', input_vector)
		animation_state.travel("Run")
		velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCELERATION * delta)
	else:
		animation_state.travel("Idle")
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)

	move()

	if Input.is_action_just_pressed("roll"):
		transition(ROLL)

	if Input.is_action_just_pressed("attack"):
		transition(ATTACK)

func roll_state(_delta: float):
	velocity = roll_vector * ROLL_SPEED
	animation_state.travel("Roll")
	move()

func attack_state(_delta: float):
	velocity = Vector2.ZERO
	animation_state.travel("Attack")

func move():
	velocity = move_and_slide(velocity)

func roll_animation_finished():
	velocity = velocity * 0.8
	transition(MOVE)

func attack_animation_finished():
	transition(MOVE)

func transition(to):
	state = to

func _on_Hurtbox_area_entered(area: Area2D):
	if area is Hitbox:
		stats.health -= 1
		hurtbox.start_invincibility(0.5)
		hurtbox.create_hit_effect()
