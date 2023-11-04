extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
const DMG = 5
var health = 100
var level = 0
var exp = 0
var max_exp_for_level_up = 100
var inventory_capacity = 10
var inventory = []
var gold = 0
var wood = 0
var equipment = { 
	"helmet": null,
	"armor": null,
	"weapon": null
	}


var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var Animations = $"CollisionShape2D/PlayerAnimation"
@onready var DmgArea = $"AlertDMG/AreaDMG"
@onready var Helmet = $"CollisionShape2D/Helmet"
@onready var Body = $"CollisionShape2D/Body"
@onready var Weapon = $"CollisionShape2D/Sword"
@onready var WeaponAnimation = $"CollisionShape2D/SwordAnimation"

func _ready():
	inventory.resize(inventory_capacity)
	WeaponAnimation.hide()
	load_player()

func _physics_process(delta):
	Animations.play("Idle")
	
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
		Helmet.flip_h = true
		Body.flip_h = true
		Weapon.flip_h = true
		WeaponAnimation.flip_h = true
		Weapon.position.x = -11
		DmgArea.position.x = -32
		WeaponAnimation.position.x = -40

	elif direction == 1:
		Helmet.flip_h = false
		Body.flip_h = false
		Weapon.flip_h = false
		WeaponAnimation.flip_h = false
		Weapon.position.x = 11
		DmgArea.position.x = 32
		WeaponAnimation.position.x = 40
	
	die()
	
	move_and_slide()


func load_player():
	if FileAccess.file_exists("res://Save/Save.txt"):
		var file = FileAccess.open("res://Save/Save.txt", FileAccess.READ)
		if file.get_length() == 0: return
		var json = JSON.new()
		json.parse(file.get_as_text())
		var data = json.get_data()
		equipment = data["equipment"]
		exp = data["exp"]
		gold = data["gold"]
		health = data["hp"]
		inventory = data["inventory"].split(";")
		level = data["level"]
		max_exp_for_level_up = data["max_exp"]
		wood = data["wood"]


func level_up():
	if (exp >= max_exp_for_level_up):
		exp -= max_exp_for_level_up
		max_exp_for_level_up = round(max_exp_for_level_up * 1.3)
		level += 1


func get_health():
	return health


func get_dmg():
	return DMG


func get_level():
	return level


func get_exp():
	return exp


func get_max_exp():
	return max_exp_for_level_up


func die():
	if (health <= 0):
		queue_free();


func receive_dmg(amount):
	health -= amount


func receive_exp(amount):
	exp += amount
	level_up()


func receive_hp(amount):
	if ((health + amount) >= 100):
		health = 100
	else:
		health += amount


func change_inventory_size(amount):
	inventory_capacity = amount
	inventory.resize(amount)


func get_inventory():
	return ";".join(inventory)


func get_equipment():
	return equipment


func get_gold():
	return gold


func get_wood():
	return wood


func receive_resource(type, amount):
	match type:
		"gold":
			gold += amount
		"wood":
			wood += amount
