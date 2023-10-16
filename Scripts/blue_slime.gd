extends CharacterBody2D

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var idle_anim = get_node("CollisionShape2D/Animation")
@onready var healthBar = get_node("HealthBar")

const SPEED = 100
const EXP = 125
var health = 10
var damage = 10
var wanderState = true

var targetEntity = null


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	
	idle_anim.play("Idle")
	
	if not is_on_floor():
		velocity.y += gravity * delta
	
	if health <= 0:
		healthBar.queue_free()
		targetEntity.recieve_exp(EXP)
		queue_free()
	
	if !wanderState:
		var direction = targetEntity.position.x - position.x
		if (direction > 0):
			velocity.x = SPEED * 1
			get_node("CollisionShape2D/Sprite2D").flip_h = true
		else:
			velocity.x = SPEED * -1
			get_node("CollisionShape2D/Sprite2D").flip_h = false
	
	change_health_bar_value(healthBar)
	
	move_and_slide()

func change_health_bar_value(bar):
	healthBar.value = health



func _on_alert_left_body_entered(body):
	if body.name == "Player":
		targetEntity = body
		wanderState = false


func _on_alert_right_body_entered(body):
	if body.name == "Player":
		targetEntity = body
		wanderState = false

func get_dmg():
	return damage
	
func recieve_dmg(amount):
	health -= amount
