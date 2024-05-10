extends Node2D

var pipeNode = preload("res://pipe.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$ParallaxBackground.scroll_offset.x -= 50 * delta
	$CanvasLayer/Control/Score.text = str(Global.score)
	
	pass


func _on_timer_timeout():
	if Global.start: 
		var newPipe = pipeNode.instantiate()
		newPipe.position.x = get_viewport_rect().end.x  # Start at the right edge
		newPipe.position.y = randf_range(get_viewport_rect().size.y/2 * 0.02, get_viewport_rect().size.y/2 * 0.5)
		add_child(newPipe)
	pass # Replace with function body.


func _on_area_2d_body_entered(body):
	if body.name == "Player":
		body.die()
	pass # Replace with function body.
