extends KinematicBody2D

const MOVEMENT_SPEED = 4500
const GRAVITY_SCALE = 500
const JUMP_FORCE = 2000

var canChangeDirection := false

var direction := 1

var velocity := Vector2.ZERO

onready var directionChangeDelay = get_node("DirectionChangeDelay")

func _ready():
	pass

func _physics_process(delta):
	_movement(delta)
	_physics_apply()
	_change_direction()
	
	print(direction)
	
func _movement(delta):
	velocity.x = MOVEMENT_SPEED * delta
	pass
	
func _change_direction():
	if velocity.x == 0:
		direction *= -1


func _physics_apply():
	velocity = move_and_slide(velocity, Vector2.UP)
	pass
