extends CharacterBody2D

# Player Attribute Variables
var playerHealth = 20
const SPEED = 150.0
const JUMP_VELOCITY = -300.0
const powerSPEED = 200.0
const powerJUMP = -350.0
var direction = Vector2(0,0)

# Get the gravity from the project settings.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

# Animations and Asset Loading
@onready var anim : AnimationTree = $AnimationTree
const bulletPath = preload("res://Player/Bullet.tscn")

# Begin Body

func _ready():
	anim.active = true
	
func _process(_delta):
	UpdateAnim()

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	
	# Handle Death
	if playerHealth <= 0:
		Death()
		
	if GlobalVariables.powerup == false:
	
		# Handle Jump.
		if Input.is_action_just_pressed("player_jump") and is_on_floor():
			velocity.y = JUMP_VELOCITY
		
		# Get the input direction and handle the movement/deceleration.
		direction = Input.get_axis("player_left", "player_right")
		if direction == -1:
			get_node("Astro").flip_h = true
		elif direction == 1:
			get_node("Astro").flip_h = false
			
		if direction:
			velocity.x = direction * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)

	if GlobalVariables.powerup == true:
		
		# Handle Jump.
		if Input.is_action_just_pressed("player_jump") and is_on_floor():
			velocity.y = powerJUMP
			#anim.play("PowerAnimations/PowerJump")
		
		# Get the input direction and handle the movement/deceleration.
		direction = Input.get_axis("player_left", "player_right")
		if direction == -1:
			get_node("Astro").flip_h = true
		elif direction == 1:
			get_node("Astro").flip_h = false
			
		if direction:
			velocity.x = direction * powerSPEED
		else:
			velocity.x = move_toward(velocity.x, 0, powerSPEED)
				
		if Input.is_action_just_pressed("player_attack") and velocity.x > 0:
			#anim.play("PowerAnimations/PowerRunningShoot")
			shoot()
		elif Input.is_action_just_pressed("player_attack"):
			#anim.play("PowerAnimations/PowerShoot")
			shoot()

	move_and_slide()

func UpdateAnim():
	# Idle - Run
	if velocity.x == 0:
		anim["parameters/conditions/idle"] = true
		anim["parameters/conditions/isRunning"] = false
	else:
		anim["parameters/conditions/isRunning"] = true
		anim["parameters/conditions/idle"] = false
	
	# Jump
	if velocity.y < 0:
		anim["parameters/conditions/isJumping"] = true
		anim["parameters/conditions/isRunning"] = false
		anim["parameters/conditions/idle"] = false
	else:
		anim["parameters/conditions/isJumping"] = false 
		
	# Blend Space
	anim["parameters/BlendSpace2D/blend_position"] = direction

func shoot():
	var bullet = bulletPath.instantiate()
	get_parent().add_child(bullet)
	bullet.position = $ShootPosition.global_position
	
func Death():
	print("Player Death")
	self.queue_free()
	get_tree().change_scene_to_file("res://Levels/Level_1_Normal.tscn")
	
	
	
	
	
	
	
	
	
