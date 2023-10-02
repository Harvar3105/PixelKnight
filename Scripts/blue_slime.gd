extends CharacterBody2D

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var idle_anim = get_node("CollisionShape2D/Animation")

const SPEED = 100
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
		queue_free()
	
	if !wanderState:
		var direction = targetEntity.position.x - position.x
		if (direction > 0):
			velocity.x = SPEED * 1
			get_node("CollisionShape2D/Sprite2D").flip_h = true
		else:
			velocity.x = SPEED * -1
			get_node("CollisionShape2D/Sprite2D").flip_h = false
	
	move_and_slide()


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
