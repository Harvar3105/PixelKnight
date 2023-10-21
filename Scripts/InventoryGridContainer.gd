extends GridContainer

@onready var buttonTemplate = preload("res://Scenes/inventory_button.tscn")


func generate_items(amount):
	for num in range(amount):
		var cell = buttonTemplate.instantiate()
		cell.set_name("InventoryButton" + str(num))
		add_child(cell)

