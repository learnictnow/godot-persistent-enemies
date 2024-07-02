extends Node

var pickup_score = 0
var pickup_count = 0

var player_health = 100

var battle_enemy:Node
var battle_player:Node

signal update_ui

var visited_scene_dict = {}

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_update_ui():
	$UI/VBoxContainer/LabelHealth.text = "Health:" + str(player_health)
	$UI/VBoxContainer/LabelScore.text = "Score: " + str(pickup_score)
	$UI/VBoxContainer/LabelPickups.text = "Pickups: " + str(pickup_count)
	#$UI/LabelLocation.text = current_location
	pass # Replace with function body.

func pack_scene(scene_node:Node):
	print(scene_node.name)
	var tmp_scene = PackedScene.new()
	var result = tmp_scene.pack(scene_node)
	visited_scene_dict.merge({scene_node.name : tmp_scene}, true)
	print(visited_scene_dict)

func store_and_switch_scene(node, change_to):
	GameManager.pack_scene(node.get_parent())
	
	var tmp_change_to = change_to.replace(":", "_")
	tmp_change_to = tmp_change_to.replace("/", "_")
	tmp_change_to = tmp_change_to.replace(".", "_")
	
	if GameManager.visited_scene_dict.has(tmp_change_to):
		get_tree().change_scene_to_packed(GameManager.visited_scene_dict.get(tmp_change_to))
	else: 
		get_tree().change_scene_to_file(change_to)

func exit_battle(change_to):
	var tmp_change_to = change_to.replace(":", "_")
	tmp_change_to = tmp_change_to.replace("/", "_")
	tmp_change_to = tmp_change_to.replace(".", "_")
	
	if GameManager.visited_scene_dict.has(tmp_change_to):
		get_tree().change_scene_to_packed(GameManager.visited_scene_dict.get(tmp_change_to))
	else: 
		get_tree().change_scene_to_file(change_to)
