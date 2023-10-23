extends Control


func _ready():
	hide()

func _on_touch_screen_button_pressed():
	get_tree().paused = false
	hide()
