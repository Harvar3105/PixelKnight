extends Node2D

@onready var healthBar = get_node("Control/HealthBar")
@onready var playerHPLabel = get_node("Control/HealthBar/PlayerHP")
@onready var player = get_node("Player")

# Called when the node enters the scene tree for the first time.
func _ready():
	Engine.max_fps = 60


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	change_health_bar_value(player, healthBar)

func change_health_bar_value(character, bar):
	healthBar.value = player.get_health()
	playerHPLabel.set_hp(player.get_health())
