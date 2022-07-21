extends AnimatedSprite


onready var Sprites = [
	get_node("Sprites/Sprite1"),
	get_node("Sprites/Sprite2"),
	get_node("Sprites/Sprite3"),
	get_node("Sprites/Sprite4"),
	get_node("Sprites/Sprite5"),
	get_node("Sprites/Sprite6"),
	get_node("Sprites/Sprite7"),
	get_node("Sprites/Sprite8"),
	get_node("Sprites/Sprite9"),
	get_node("Sprites/Sprite10"),
	get_node("Sprites/Sprite11"),
	get_node("Sprites/Sprite12"),
	get_node("Sprites/Sprite13"),
]

onready var animationPlayer = get_node("AnimationPlayer")

func _ready():
	Sprites[frame - 1].visible = true
	frame = 0


func _on_LeftTrigger_body_entered(body):
	if animationPlayer.is_playing() == false and body.is_in_group("Entity"):
		animationPlayer.play("Rocking Right")

func _on_RightTrigger_body_entered(body):
	if animationPlayer.is_playing() == false and body.is_in_group("Entity"):
		animationPlayer.play("Rocking Left")
