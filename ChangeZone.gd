extends Area3D

@export_file("*.tscn") var change_to
@export_file("*.tscn") var change_from

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	if body.is_in_group("Player"):
		#get_tree().change_scene_to_file(change_to)
		
		
		
		print("Player changing scene")
		
		body.position = $Marker3D.global_position

		GameManager.store_and_switch_scene(self, change_to)
		pass # Replace with function body.
