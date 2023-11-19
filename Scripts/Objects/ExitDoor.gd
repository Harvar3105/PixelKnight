extends Node2D


var Player = null

func _on_door_alert_body_entered(body):
	if body.name == "Player":
		Player = body
		save_player()
		get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")


func save_player():
	var save_game = FileAccess.open("res://Save/Save.txt", FileAccess.WRITE)
	var data = {}
	data["exp"] = Player.get_exp()
	data["level"] = Player.get_level()
	data["max_exp"] = Player.get_max_exp()
	data["inventory"] = Player.get_inventory()
	data["gold"] = Player.get_gold()
	data["wood"] = Player.get_wood()
	data["equipment"] = Player.get_equipment()
	save_game.store_string(JSON.stringify(data, "\t"))
