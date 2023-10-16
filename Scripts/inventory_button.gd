extends Control

var CurrentItem
var CurrentIndex
var CurrentAmount = null
@onready var CurrentIcon = $Panel/Count

signal OnButtonClick(index, item)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_cell_button_pressed():
	pass # Replace with function body.
