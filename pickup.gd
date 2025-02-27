extends Area3D

@export var points = 5

@export var pickup_id = -1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	if body.is_in_group("Player"):
		GameManager.pickup_count += 1
		GameManager.pickup_score += points
		GameManager.update_ui.emit()
		queue_free()
	pass # Replace with function body.
