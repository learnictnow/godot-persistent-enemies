extends Node

var show_subtitles = false

var enemies: Array[Node]

var battle_enemy
var in_battle = false

var pickup_score = 0
var pickup_count = 0

var player_health = 100
var current_location = "NOWHERE"

signal update_ui

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
	$UI/LabelLocation.text = current_location
	pass # Replace with function body.
