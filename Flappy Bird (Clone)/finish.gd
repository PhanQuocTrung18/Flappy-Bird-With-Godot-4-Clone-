extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Control/Score.text = str(Global.score)
	pass


func _on_texture_button_pressed():
	if Global.score > Global.highest:
		Global.highest = Global.score
		Global.saveGame()
	Global.reset()
	get_tree().reload_current_scene()
	self.queue_free()
	pass # Replace with function body.
