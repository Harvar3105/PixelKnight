extends Control

var CurrentItem
var CurrentIndex
var CurrentAmount = null
@onready var CurrentIcon = $Count


signal OnButtonClick(index, item)


func _process(delta):
	pass
