class_name IdleState
extends PlayerState

#var timeIdle: tim = posgraopuhgraoupharguhope
#idle animations code

func enter() -> void:
	player.animatedSprite2d.flip_h = false
	player.animatedSprite2d.play("default (front face short idel)")
	player.velocity.x = 0;

func update(_delta: float) -> PlayerState:
	if(player.direction && !player.test_move(player.get_global_transform(), Vector2(player.direction, 0.0))): #if the player is trying to move and its not just the kind where you are trying to go up agienst a wall, we should walk
		#if(Input.is_action_pressed("run", false)): //when we make running
			#return player.RunState
		return $"../WalkState"

	#if crouch ect.
	
	return self
	
func exit() -> void:
	pass
