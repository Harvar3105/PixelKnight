extends Node2D


@onready var HealthBar = get_node("ControlLayout/TopLeftIndicators/HealthBar")
@onready var PlayerHPLabel = get_node("ControlLayout/TopLeftIndicators/HealthBar/PlayerHP")
@onready var ExpBar = get_node("ControlLayout/TopLeftIndicators/LevelUpBar")
@onready var PlayerLevelLabel = get_node("ControlLayout/TopLeftIndicators/LevelFont/Label")
@onready var Player = get_node("Player")
@onready var PauseMenu = get_node("ControlLayout/PauseMenu")
@onready var InventoryMenu = get_node("ControlLayout/InventoryMenu")


func _ready():
	Engine.max_fps = 60


func _process(delta):
	change_health_bar_value()
	change_exp_bar_value()
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

func pause_game():
	PauseMenu.set_visible(true)
	get_tree().paused = true

func open_inventory():
	InventoryMenu.set_visible(true)
	get_tree().paused = true
