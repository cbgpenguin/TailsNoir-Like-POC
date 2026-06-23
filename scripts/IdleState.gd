class_name IdleState
extends PlayerState

@onready var stretchTimer: Timer = $stretchTimer
@onready var stretches: Array = ["foot taps (while idle  looks like regular idle but triggers occasionally after waiting and foot is impatient)"]

func enter() -> void:
	player.animatedSprite2d.flip_h = false
	player.animatedSprite2d.play("default (front face short idel)")
	player.velocity.x = 0;
	
	stretchTimer.start(randfn(15, 3.5))

func update(_delta: float) -> PlayerState:
	if(player.direction && !player.test_move(player.get_global_transform(), Vector2(player.direction, 0.0))): #if the player is trying to move and its not just the kind where you are trying to go up agienst a wall, we should walk
		if(Input.is_action_pressed("run", false)):
			return $"../RunState"
		return $"../WalkState"

	#if crouch ect.
	return self
	
func _on_stretch_timer_timeout():
	await player.animatedSprite2d.animation_looped
	player.animatedSprite2d.play(stretches[randi() % stretches.size()]) #Chooses random stretch animation from array to start at the bigining of the idle loop so it can look like normal idle loop w/ exta but not be or just smooth transition into
	await player.animatedSprite2d.animation_finished
	enter() #reset to normal idle

func exit() -> void:
	stretchTimer.stop()
