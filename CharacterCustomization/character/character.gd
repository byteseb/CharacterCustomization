extends KinematicBody2D

const GRAVITY = 200
const MAX_SPEED = 200
const JUMP_FORCE = 100

var velocity = Vector2()

onready var anim = $AnimationPlayer
onready var body = $Body
onready var legs = $Legs
onready var chest = $Chest
onready var eyes = $Eyes
onready var hair = $Hair

func _on_Body_frame_changed():
	sync_frames(body.frame, body.flip_h)

func sync_frames(frame, flip_h):
	legs.frame = frame
	chest.frame = frame
	eyes.frame = frame
	hair.frame = frame
	
	legs.flip_h = flip_h
	chest.flip_h = flip_h
	eyes.flip_h = flip_h
	hair.flip_h = flip_h
