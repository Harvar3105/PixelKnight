extends Area2D

var canBeDamaged = false
@onready var damage = get_parent().get_dmg()
var targetEntity = null

func _on_body_entered(body):
	if body.name =="Player":
		targetEntity = body
		canBeDamaged = true
		while (canBeDamaged):
			targetEntity.recieve_dmg(damage)
			await get_tree().create_timer(0.5).timeout


func _on_body_exited(body):
	if body.name =="Player":
		targetEntity = null
		canBeDamaged = false
