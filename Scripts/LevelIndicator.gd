extends Label

var LEVEL

func _process(delta):
	text = str(LEVEL)

func set_level(amount):
	LEVEL = amount
