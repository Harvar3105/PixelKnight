extends GridContainer

@onready var ButtonTemplate = preload("res://UI/inventory_button.tscn")
@onready var Player = get_tree().get_root().get_node("World/Player")

func generate_items(amount):
	var inventory = Player.get_inventory().split(';')
	print(Player)
	for num in range(amount):
		var cell = ButtonTemplate.instantiate()
		cell.set_name("InventoryButton" + str(num))
		
		if (num < inventory.size()):
			print(inventory[num])
			
			match inventory[num]:
				"'health_potion'":
					print("Yes")
					cell.get_node('Texture').texture = ResourceLoader.load('res://Materials/Items/HealthPotion.png')
		
		add_child(cell)
	print(get_child_count())

