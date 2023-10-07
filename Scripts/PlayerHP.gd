extends Label

var HP

func _process(delta):
	text = str(HP)

func set_hp(amount):
	HP = amount
