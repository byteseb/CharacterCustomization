extends "res://character/character.gd"

var pos
var body_color
var eyes_color
var hair_color
var hairstyle
var chestplate
var trousers

func initialize(_pos, _body_color, _eyes_color, _hair_color, _hairstyle, _chestplate, _trousers):
	pos = _pos
	body_color = _body_color
	eyes_color = _eyes_color
	hair_color = _hair_color
	hairstyle = _hairstyle
	chestplate = _chestplate
	trousers = _trousers

func _ready():
	position = pos
	body.self_modulate = body_color
	eyes.self_modulate = eyes_color
	hair.self_modulate = hair_color
	hair.texture = hairstyle
	chest.texture = chestplate
	legs.texture = trousers
	anim.play("idling")

func _physics_process(delta):
	velocity.y += delta * GRAVITY
	move_and_slide(velocity, Vector2.UP)
