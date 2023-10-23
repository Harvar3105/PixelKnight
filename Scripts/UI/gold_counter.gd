extends Label

var gold

func _process(delta):
	text = gold

func set_gold(amount):
	gold = str(amount)
