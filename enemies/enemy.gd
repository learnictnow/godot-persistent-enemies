extends CharacterBody3D

const SPEED = 5.0
const JUMP_VELOCITY = 4.5

@export var health = 100
@export var id:String

@export_file("*.tscn") var change_to

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

func _ready():
	toggle_battle()
	#change_to = get_tree().current_scene.scene_file_path
	print("Enemy Level: " + change_to)

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta




func _on_player_detector_body_entered(body):
	if body.is_in_group("Player"):
		print("Enemy Player: " + change_to)
		#GameManager.enemy = self
		#GameManager.player = body
		#GameManager.store_and_switch_scene(self, change_to)
		
		body.position = $Marker3D.global_position
		print(body.position)
		#GameManager.battle(self, change_to)
		#self.get_parent().visible = false
		#call_deferred("disable_movement")
		#await disable_movement()
		get_tree().paused = true
		print("Process: " + str(self.get_parent()))
		$Battle/Control.visible = true
		$Battle.visible = true
		#toggle_battle()
		
		
	pass # Replace with function body.

func disable_movement():
	self.process_mode = PROCESS_MODE_ALWAYS
	self.get_parent().process_mode = PROCESS_MODE_DISABLED
	

func enable_movement():
	self.get_parent().process_mode = PROCESS_MODE_INHERIT
	self.process_mode = Node.PROCESS_MODE_INHERIT

func toggle_battle():
	$Battle/Control.visible = !$Battle/Control.visible
	$Battle.visible = !$Battle.visible


func _on_battle_leave_battle():
	print("Here")
	#enable_movement()
	
	#self.get_parent().visible = true
	$Battle/Control.visible = false
	$Battle.visible = false
	pass # Replace with function body.


func _on_battle_won_battle():
	GameManager.kills += 1
	get_tree().paused = false
	GameManager.update_ui.emit()
	queue_free()
	
	pass # Replace with function body.
