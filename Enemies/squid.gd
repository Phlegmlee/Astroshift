extends CharacterBody2D

var mobHealth = 3
var SPEED = 50
var mobDamage = 2
#var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
#player node for mob to use
@onready var player = get_node("../../Player/Player")
var chase = false

#gravity
func _process(_delta):
	#velocity.y += gravity * delta
	if chase == true:
		get_node("AnimatedSprite2D").play("Move")
		var direction = (player.position - self.position).normalized()
		if direction.x > 0:
			get_node("AnimatedSprite2D").flip_h = true
		else:
			get_node("AnimatedSprite2D").flip_h = false
			
		velocity.x = direction.x * SPEED
		velocity.y = direction.y * SPEED
	else:
		velocity.x = 0
		velocity.y = 0
		if get_node("AnimatedSprite2D").animation != "Death":
			get_node("AnimatedSprite2D").play("Idle")
	move_and_slide()

func _on_player_detection_body_entered(body):
	if body.name == "Player":
		chase = true

func _on_player_detection_body_exited(body):
	if body.name == "Player":
		chase = false

func _on_damage_hitbox_body_entered(body):
	if body.name == "Bullet":
		death()
		
func _on_attack_hitbox_body_entered(body):
	if body.name == "Player":
		body.playerHealth -= mobDamage
	
func death():
	print("mob death")
	chase = false
	get_node("AnimatedSprite2D").play("Death")
	await get_node("AnimatedSprite2D").animation_finished
	self.queue_free()



