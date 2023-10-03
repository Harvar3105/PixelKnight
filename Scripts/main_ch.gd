extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
const DMG = 5
var health = 100


var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var idleAnim = get_node("CollisionShape2D/Idle")
@onready var dmgArea = get_node("AlertDMG/AreaDMG")

func _physics_process(delta):
	idleAnim.play("Idle")
	
	if not is_on_floor():
		velocity.y += gravity * delta
	var direction = Input.get_axis("ui_left", "ui_right")
	if Input.is_action_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = 0
	
	if direction == -1:
		get_node("CollisionShape2D/Sprite2D").flip_h = true
		dmgArea.position.x = -32

	elif direction == 1:
		get_node("CollisionShape2D/Sprite2D").flip_h = false
		dmgArea.position.x = 32

	
	die()
	
	move_and_slide()



func get_health():
	return health

func get_dmg():
	return DMG

func die():
	if (health <= 0):
		queue_free();

func recieve_dmg(amount):
	health -= amount

