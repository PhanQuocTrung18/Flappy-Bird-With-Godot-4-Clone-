extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if !Global.stop and Global.start:
		self.position.x -= 60 * delta
	pass


func _on_top_area_body_entered(body):
	print('Top',body.name)
	if body.name == "Player":
		body.die()
	pass # Replace with function body.


func _on_bottom_area_body_entered(body):
	print('Bottom',body.name)
	if body.name == "Player":
		body.die()
	pass # Replace with function body.


func _on_area_2d_body_entered(body):
	if body.name == "Player":
		Global.score += 1
		body.get_point()
	pass # Replace with function body.


func _on_visible_on_screen_notifier_2d_screen_exited():
	await get_tree().create_timer(2).timeout
	self.queue_free() # delete pipe 
	pass # Replace with function body.
