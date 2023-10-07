extends Node2D

@onready var healthBar = get_node("CanvasLayer/Control/HealthBar")
@onready var playerHPLabel = get_node("CanvasLayer/Control/HealthBar/PlayerHP")
@onready var expBar = get_node("CanvasLayer/Control/LevelUpBar")
@onready var playerLevelLabel = get_node("CanvasLayer/Control/LevelFont/Label")
@onready var player = get_node("Player")

# Called when the node enters the scene tree for the first time.
func _ready():
	Engine.max_fps = 60


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	change_health_bar_value()
	change_exp_bar_value()


func change_health_bar_value():
	healthBar.value = player.get_health()
	playerHPLabel.set_hp(player.get_health())

func change_exp_bar_value():
	expBar.value = player.get_exp()
	expBar.max_value = player.get_max_exp()
	playerLevelLabel.set_level(player.get_level())
