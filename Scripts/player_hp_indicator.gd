extends Label

var hp

func _process(delta):
	text = str(hp)

func set_hp(amount):
	hp = amount
