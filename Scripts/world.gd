extends Node2D


@onready var healthBar = get_node("ControlLayout/TopLeftIndicators/HealthBar")
@onready var playerHPLabel = get_node("ControlLayout/TopLeftIndicators/HealthBar/PlayerHP")
@onready var expBar = get_node("ControlLayout/TopLeftIndicators/LevelUpBar")
@onready var playerLevelLabel = get_node("ControlLayout/TopLeftIndicators/LevelFont/Label")
@onready var player = get_node("Player")
@onready var pauseMenu = get_node("ControlLayout/PauseMenu")


func _ready():
	Engine.max_fps = 60


func _process(delta):
	change_health_bar_value()
	change_exp_bar_value()
	if Input.is_action_pressed("ui_pause"):
		pause_game()


func change_health_bar_value():
	healthBar.value = player.get_health()
	playerHPLabel.set_hp(player.get_health())

func change_exp_bar_value():
	expBar.value = player.get_exp()
	expBar.max_value = player.get_max_exp()
	playerLevelLabel.set_level(player.get_level())

func pause_game():
	pauseMenu.set_visible(true)
	get_tree().paused = true
