extends Node

var player
var enemy

@export_file("*.tscn") var change_to

signal leave_battle
signal won_battle

# Called when the node enters the scene tree for the first time.
func _ready():
	player = GameManager.battle_player
	enemy = GameManager.battle_enemy
	
	#$Camera3D.current = true
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func setup_battle(e, p):
	
	enemy = e
	player = p
	
	
	enemy.position = $MarkerEnemy.position
	player.position = $MarkerPlayer.position
	$Camera3D.current = true


func _on_button_escape_pressed():
	print("Escaping")
	GameManager.damage_player(20)
	#GameManager.store_and_switch_scene(self, change_to)
	#GameManager.exit_battle(change_to)
	#GameManager.exit_battle()
	#get_tree().paused = false
	leave_battle.emit()
	
	
	pass # Replace with function body.


func _on_button_pressed():
	won_battle.emit()
	pass # Replace with function body.
