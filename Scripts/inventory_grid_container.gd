extends GridContainer

@onready var ButtonTemplate = preload("res://Scenes/inventory_button.tscn")


func generate_items(amount):
	for num in range(amount):
		var cell = ButtonTemplate.instantiate()
		cell.set_name("InventoryButton" + str(num))
		add_child(cell)

