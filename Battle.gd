extends Node

var player
var enemy

# Called when the node enters the scene tree for the first time.
func _ready():
	GameManager.in_battle = true
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func setup_battle(e):
	
	enemy = e
	
	$MarkerEnemy.position = enemy.position
	$Camera3D.current = true
