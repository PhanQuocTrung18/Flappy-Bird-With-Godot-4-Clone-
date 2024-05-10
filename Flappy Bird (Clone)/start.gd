extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Control/Score.text = str(Global.highest)
	pass


func _on_texture_button_pressed():
	Global.start = true
	self.queue_free()
	pass # Replace with function body.
