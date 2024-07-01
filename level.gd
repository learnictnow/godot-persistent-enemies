extends Node3D

@export var location_name:String

# Called when the node enters the scene tree for the first time.
func _ready():
	GameManager.current_location = location_name
	GameManager.update_ui.emit()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
