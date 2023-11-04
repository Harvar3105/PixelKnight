extends Control



func _ready():
	hide()


func _on_continue_pressed():
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")


func _on_quit_pressed():
	get_tree().free()
