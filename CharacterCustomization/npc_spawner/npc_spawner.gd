extends Node2D

var npc = preload("res://npc/npc.tscn")

onready var timer = $Timer
export var spawn_time : int = 1 #Seconds to wait before spawning another NPC

#Character presets

#Skin preset
export var body_colors : PoolColorArray = [Color("#ffb67a"), Color("#a3754e")]
#Eyes preset
export var eye_colors : PoolColorArray = [Color("#00d5ff")]
#Hair preset
export var hair_colors: PoolColorArray = [Color("#3c3c3c"), Color("#d8c490"), Color("#94dcc4")]
export(Array, Texture) var hairstyles = [preload("res://character/hair.png"), preload("res://character/hair2.png")]
#Chest preset
export(Array, Texture) var chestplates = [preload("res://character/chest.png"), preload("res://character/chest2.png")]
#Legs preset
export(Array, Texture) var trousers = [preload("res://character/legs.png"), preload("res://character/legs2.png")]

func _ready():
	timer.start(spawn_time)
	
func spawn():
	var instance = npc.instance()
	var pos = Vector2(position.x + rand_range(-50, 50), position.y)
	instance.initialize(pos, rnd_item(body_colors), rnd_item(eye_colors), rnd_item(hair_colors), rnd_item(hairstyles), rnd_item(chestplates), rnd_item(trousers))
	get_tree().current_scene.add_child(instance)

func rnd_item(array : Array):
	randomize()
	array.shuffle()
	return array.front()

func _on_Timer_timeout():
	spawn()
