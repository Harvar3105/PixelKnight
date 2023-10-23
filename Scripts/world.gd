extends Node2D


@onready var HealthBar = $"ControlLayout/TopLeftIndicators/HealthBar"
@onready var PlayerHPLabel = $"ControlLayout/TopLeftIndicators/HealthBar/PlayerHP"
@onready var ExpBar = $"ControlLayout/TopLeftIndicators/LevelUpBar"
@onready var PlayerLevelLabel = $"ControlLayout/TopLeftIndicators/LevelFont/Label"
@onready var Player = $"Player"
@onready var PauseMenu = $"ControlLayout/PauseMenu"
@onready var InventoryMenu = $"ControlLayout/InventoryMenu"
@onready var PlayerGoldCounter = $ControlLayout/TopLeftIndicators/GoldCoin/GoldCounter
@onready var PlayerWoodCounter = $ControlLayout/TopLeftIndicators/Wood/WoodCounter
@onready var DeathScreen = $ControlLayout/DeathScreen


func _ready():
	Engine.max_fps = 60


func _process(delta):
	change_health_bar_value()
	change_exp_bar_value()
	change_player_gold_counter()
	change_player_wood_counter()
	
	if Input.is_action_pressed("ui_pause"):
		pause_game()
	if Input.is_action_pressed("ui_inventory"):
		open_inventory()


func change_health_bar_value():
	HealthBar.value = Player.get_health()
	PlayerHPLabel.set_hp(Player.get_health())


func change_exp_bar_value():
	ExpBar.value = Player.get_exp()
	ExpBar.max_value = Player.get_max_exp()
	PlayerLevelLabel.set_level(Player.get_level())


func change_player_gold_counter():
	var gold = Player.get_gold()
	PlayerGoldCounter.set_gold(gold)


func change_player_wood_counter():
	var wood = Player.get_wood()
	PlayerWoodCounter.set_wood(wood)


func pause_game():
	PauseMenu.set_visible(true)
	get_tree().paused = true


func open_inventory():
	InventoryMenu.set_visible(true)
	get_tree().paused = true

func show_death_screen():
	DeathScreen.set_visible(true)
	get_tree().paused = true
