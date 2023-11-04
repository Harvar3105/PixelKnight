extends CharacterBody2D

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var IdleAnim = get_node("CollisionShape2D/Animation")
@onready var HealthBar = get_node("HealthBar")

const SPEED = 100
const EXP = 125
var health = 10
var damage = 10
var gold = randi() % 16 + 10
var wood = randi() % 2 + 5
var wander_state = true
var target_entity = null


func _physics_process(delta):
	
	IdleAnim.play("Idle")
	
	if not is_on_floor():
		velocity.y += gravity * delta
	
	if health <= 0:
		HealthBar.queue_free()
		target_entity.receive_exp(EXP)
		target_entity.receive_resource("gold", gold)
		target_entity.receive_resource("wood", wood)
		queue_free()
	
	if !wander_state:
		var direction = target_entity.position.x - position.x
		if (direction > 0):
			velocity.x = SPEED * 1
			get_node("CollisionShape2D/Sprite2D").flip_h = true
		else:
			velocity.x = SPEED * -1
			get_node("CollisionShape2D/Sprite2D").flip_h = false
	
	change_health_bar_value(HealthBar)
	
	move_and_slide()

func change_health_bar_value(bar):
	HealthBar.value = health



func _on_alert_left_body_entered(body):
	if body.name == "Player":
		target_entity = body
		wander_state = false


func _on_alert_right_body_entered(body):
	if body.name == "Player":
		target_entity = body
		wander_state = false

func get_dmg():
	return damage
	
func receive_dmg(amount):
	health -= amount
