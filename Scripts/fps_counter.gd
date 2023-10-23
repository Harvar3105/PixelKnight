extends Label


func _ready():
	pass # Replace with function body.


func _process(delta):
	var fps = Engine.get_frames_per_second()
	text = "FPS: " + str(fps)
