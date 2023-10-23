extends Label


var wood

func _process(delta):
	text = wood

func set_wood(amount):
	wood = str(amount)
