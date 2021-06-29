extends "res://character/character.gd"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _physics_process(delta):
	velocity.y += delta * GRAVITY
	
	if Input.is_action_pressed("right"):
		anim.play("walking")
		velocity.x = MAX_SPEED
		body.flip_h = false
		sync_frames(body.frame, body.flip_h)
	elif Input.is_action_pressed("left"):
		anim.play("walking")
		velocity.x = -MAX_SPEED
		body.flip_h = true
		sync_frames(body.frame, body.flip_h)
	else:
		anim.play("idling")
		velocity.x = 0
		
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = -JUMP_FORCE
		
	move_and_slide(velocity, Vector2.UP)
