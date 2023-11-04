extends Area2D

var can_be_damaged = false
@onready var Damage = get_parent().get_dmg()
var target_entity = null


func _on_body_entered(body):
	if body.name =="Player":
		target_entity = body
		can_be_damaged = true
		while (can_be_damaged):
			target_entity.receive_dmg(Damage)
			await get_tree().create_timer(0.5).timeout


func _on_body_exited(body):
	if body.name =="Player":
		target_entity = null
		can_be_damaged = false
