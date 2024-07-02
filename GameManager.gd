extends Node

var pickup_score = 0
var pickup_count = 0

var player_health = 100

var battle_enemy:Node
var battle_player:Node

var kills = 0

var current_location = "UNCKOWN"

signal update_ui

var visited_scene_dict = {}

# Called when the node enters the scene tree for the first time.
func _ready():
	#toggle_battle()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_update_ui():
	$UI/VBoxContainer/LabelHealth.text = "Health:" + str(player_health)
	$UI/VBoxContainer/LabelScore.text = "Score: " + str(pickup_score)
	$UI/VBoxContainer/LabelPickups.text = "Pickups: " + str(pickup_count)
	$UI/VBoxContainer/LabelKills.text = "Kills: " + str(kills)
	$UI/LabelLocation.text = current_location
	pass # Replace with function body.

func pack_scene(scene_node:Node):
	print(scene_node.name)
	var tmp_scene = PackedScene.new()
	var result = tmp_scene.pack(scene_node)
	#print(result)
	visited_scene_dict.merge({scene_node.name : tmp_scene}, true)
	#print(visited_scene_dict)

func store_and_switch_scene(node, change_to):
	GameManager.pack_scene(node.get_parent())
	
	var tmp_change_to = change_to.replace(":", "_")
	tmp_change_to = tmp_change_to.replace("/", "_")
	tmp_change_to = tmp_change_to.replace(".", "_")
	
	if GameManager.visited_scene_dict.has(tmp_change_to):
		get_tree().change_scene_to_packed(GameManager.visited_scene_dict.get(tmp_change_to))
	else: 
		get_tree().change_scene_to_file(change_to)


var battle_level = {}
var cur_battle_level

func battle(node, battle_file_path):
	print("Battle State " + node.name + " : Parent " + node.get_parent().name)
	
	#GameManager.pack_scene(node.get_parent())
	
	#var return_to_level = current_level.replace(":", "_")
	#return_to_level = return_to_level.replace("/", "_")
	#return_to_level = return_to_level.replace(".", "_")
	var tmp_scene = PackedScene.new()
	tmp_scene.pack(node.get_parent())
	
	battle_level = {node.get_parent().name : tmp_scene}
	
	cur_battle_level = tmp_scene
	
	#print(node.get_parent())
	print(battle_level)
	
	get_tree().change_scene_to_file(battle_file_path)
 
func exit_battle(battle_won):
	print(battle_level.values())

	get_tree().change_scene_to_packed(cur_battle_level)


func damage_player(dmg):
	player_health -= dmg
	_on_update_ui()
	get_tree().paused = false
	if player_health <=0:
		get_tree().change_scene_to_file("res://game_over.tscn")
