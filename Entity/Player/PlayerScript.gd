extends KinematicBody2D

const MOVEMENT_SPEED = 4750
const GRAVITY_SCALE = 1000
const JUMP_FORCE = 17000

var canChangeDirection := true

var direction := 1

var velocity := Vector2.ZERO

onready var directionChangeDelay = get_node("DirectionChangeDelay")
onready var sprite = get_node("Interpolation2D/Sprite")

func _ready():
	pass

func _physics_process(delta):
	_movement(delta)
	_gravity(delta)
	_jump(delta)
	_physics_apply()
	
	_change_direction()
	_change_animatios()
	
	
func _movement(delta):
	velocity.x = MOVEMENT_SPEED * direction * delta
	pass
	
func _change_direction():
	if is_on_wall() and canChangeDirection:
		direction *= -1
		canChangeDirection = false
		directionChangeDelay.start()

func _gravity(delta):
	velocity.y += GRAVITY_SCALE * delta

func _jump(delta):
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		velocity.y -= JUMP_FORCE * delta

func _physics_apply():
	velocity = move_and_slide(velocity, Vector2.UP)
	pass

func _change_animatios():
	if velocity.y > 0:
		sprite.play("Fall")
	elif velocity.y < 0:
		sprite.play("Jump")
	elif velocity.x != 0:
		sprite.play("Run")
	else:
		sprite.play("Idle")
		
	if velocity.x > 0:
		sprite.flip_h = false
	else:
		sprite.flip_h = true

func _on_DirectionChangeDelay_timeout():
	canChangeDirection = true
