extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
const DMG = 5
var HEALTH = 100
var LEVEL = 0
var EXP = 0
var MAX_EXP_FOR_LVL_UP = 100
var INVENTORY_CAPACITY = 10


var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var animations = get_node("CollisionShape2D/PlayerAnimation")
@onready var dmgArea = get_node("AlertDMG/AreaDMG")
@onready var helmet = $"CollisionShape2D/Helmet"
@onready var body = $"CollisionShape2D/Body"
@onready var weapon = $"CollisionShape2D/Sword"

func _physics_process(delta):
	animations.play("Idle")
	
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
		helmet.flip_h = true
		body.flip_h = true
		weapon.flip_h = true
		weapon.position.x = -11
		dmgArea.position.x = -32

	elif direction == 1:
		helmet.flip_h = false
		body.flip_h = false
		weapon.flip_h = false
		weapon.position.x = 11
		dmgArea.position.x = 32
	
	die()
	
	move_and_slide()

func level_up():
	if (EXP >= MAX_EXP_FOR_LVL_UP):
		EXP -= MAX_EXP_FOR_LVL_UP
		MAX_EXP_FOR_LVL_UP = round(MAX_EXP_FOR_LVL_UP * 1.3)
		LEVEL += 1

func get_health():
	return HEALTH

func get_dmg():
	return DMG

func get_level():
	return LEVEL

func get_exp():
	return EXP

func get_max_exp():
	return MAX_EXP_FOR_LVL_UP

func die():
	if (HEALTH <= 0):
		queue_free();

func recieve_dmg(amount):
	HEALTH -= amount

func recieve_exp(amount):
	EXP += amount
	level_up()

func recieve_hp(amount):
	if ((HEALTH + amount) >= 100):
		HEALTH = 100
	else:
		HEALTH += amount
