extends CharacterBody3D

var battlescene = preload("res://battle.tscn")

const SPEED = 5.0
const JUMP_VELOCITY = 4.5

@export var health = 100
@export var id:String

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

func _ready():
	GameManager.enemies.append(self)

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta




func _on_player_detector_body_entered(body):
	if body.is_in_group("Player"):
		print("Player")
		#body.battle(self)
		var tmp = battlescene.instantiate()
		tmp.setup_battle(body, self)
		add_child(tmp)
		
	pass # Replace with function body.
