extends Area2D

@onready var damage = get_parent().get_dmg()
var targetEntity = null

var canHit = true

func _input(event):
	if event.is_action_pressed("ui_hit") && targetEntity != null && canHit:
		targetEntity.recieve_dmg(damage)
		canHit = false
		await get_tree().create_timer(0.5).timeout
		canHit = true

func _on_body_entered(body):
	if body.name == "BlueSlime":
		targetEntity = body


func _on_body_exited(body):
	if body.name == "BlueSlime":
		targetEntity = null
