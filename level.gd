extends Node3D

@export var location_name:String

# Called when the node enters the scene tree for the first time.
func _ready():
	
	GameManager.update_ui.emit()
	name = get_tree().current_scene.scene_file_path
	
	print($Player.position)
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	pass
