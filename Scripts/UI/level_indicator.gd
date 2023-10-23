extends Label

var level

func _process(delta):
	text = level

func set_level(amount):
	level = str(amount)
