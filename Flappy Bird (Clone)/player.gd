extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var isLive = true
var isUp = false

func _physics_process(delta):
	if Global.start:
	# Add the gravity.
		if not is_on_floor():
			velocity.y += gravity * delta

		# Handle jump.
		if Input.is_action_just_pressed("ui_accept") and isLive:
			isUp = true
			velocity.y = JUMP_VELOCITY
			$AnimationPlayer.stop()
			$AnimationPlayer.play("up")
			$Sound/wing.play()

	move_and_slide()
func die():
	if isLive:
		$Sound/hit.play()
		isLive = false
		Global.stop = true
		await get_tree().create_timer(0.5).timeout
		$Sound/die.play()
		Global.on_stop()
	pass
	
func get_point():
	$Sound/point.play()
