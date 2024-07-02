extends CharacterBody3D

const SPEED = 5.0
const JUMP_VELOCITY = 4.5

@export var health = 100
@export var id:String

@export_file("*.tscn") var change_to

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

func _ready():
	#change_to = get_tree().current_scene.scene_file_path
	print("Enemy Level: " + change_to)

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta




func _on_player_detector_body_entered(body):
	if body.is_in_group("Player"):
		print("Enemy Player: " + change_to)
		GameManager.enemy = self
		GameManager.player = body
		GameManager.store_and_switch_scene(self, change_to)
		
		
	pass # Replace with function body.
