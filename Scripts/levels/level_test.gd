extends Node2D

@onready var Player = get_parent().get_node("Player")

var item_list = ['heal_potion', 'none']



func _on_blue_slime_tree_exited():
	print('Blue slime exited')
	var item_pos = randi() % item_list.size()
	if item_list[item_pos] == 'none':
		return
	Player.receive_item(item_list[item_pos])
