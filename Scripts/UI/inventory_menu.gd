extends Control

var inventoryCellsAmount = 25
@onready var gridContainer = $"ScrollContainer/GridContainer"
var start = false

func _ready():
	hide()


func _on_close_inventory_button_pressed():
	get_tree().paused = false
	hide()


func recieve_inventory_cells_amount(amount):
	inventoryCellsAmount = amount


func _on_visibility_changed():
	if not start:
		start = true
		return
	if self.visible == true:
		gridContainer.generate_items(inventoryCellsAmount)
	else:
		var cells = gridContainer.get_children()
		for child in cells:
			gridContainer.remove_child(child)
