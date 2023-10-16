extends Label

var LEVEL

func _process(delta):
	text = LEVEL

func set_level(amount):
	LEVEL = str(amount)
