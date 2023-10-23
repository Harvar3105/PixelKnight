extends Control

var inventoryCellsAmount = 25
@onready var gridContainer = $"ScrollContainer/GridContainer"


func _ready():
	gridContainer.generate_items(inventoryCellsAmount)
	hide()


func _on_close_inventory_button_pressed():
	get_tree().paused = false
	hide()


func recieve_inventory_cells_amount(amount):
	inventoryCellsAmount = amount
