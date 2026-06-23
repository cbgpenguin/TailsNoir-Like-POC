class_name RunState
extends WalkState


func enter() -> void:
	player.animatedSprite2d.play("running (ohh whats the pretty cat boi running from??)")
	SPEED = 100 # wholy shit I can't belive this works! inherets everything from walk exept uses a modified speed just for running???????!! That's too cool

func update(_delta: float) -> PlayerState:
	if(!Input.is_action_pressed("run")):
		return $"../WalkState"
	return super.update(_delta)
