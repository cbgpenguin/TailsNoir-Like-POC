class_name WalkState
extends PlayerState

const SPEED = 60 # Pixles/s

func enter() -> void:
	player.animatedSprite2d.play("walking (self explanatory but I felt like giving a description)")
	

func update(_delta: float) -> PlayerState:
	if(!player.direction):
		player.velocity.x = move_toward(player.velocity.x, 0, (1000 * _delta)) #Slows it down by taking x velocity and incrementing it towards 0 
	
	player.velocity.x = player.direction * SPEED
	player.move_and_slide()
	
	if(player.direction == -1):
		player.animatedSprite2d.flip_h = true
	else:
		player.animatedSprite2d.flip_h = false
	
	
	if(!player.velocity.x or player.move_and_slide() == true): #if it is still or it collided become idle
		return $"../IdleState"
	
	#if(Input.is_action_pressed("run", false)):
		#return player.run

	#if crouch ect.
		
	return self

func exit() -> void:
	pass
