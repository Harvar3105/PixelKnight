extends Area2D

var playerCanBeDamaged = false
var timer = 0.0
var timerIsWorking = false

func _ready():
	var character = get_node("res://Scripts/blue_slime.gd")

func _process(delta):
	
	if (!targetEntity.is_null() && playerCanBeDamaged):
		timerIsWorking = true
		if timer % 10 == 0.0:
			targetEntity.get_dmg(damage)
	else :
		timerIsWorking = false
	
	if timerIsWorking == true:
		timer += delta
	


func _on_body_entered(body):
	if body.name == "Player":
		playerCanBeDamaged = true


func _on_body_exited(body):
	if body.name == "Player":
		playerCanBeDamaged = false

