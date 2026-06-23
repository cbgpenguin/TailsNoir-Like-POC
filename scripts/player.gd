extends CharacterBody2D

@onready var animatedSprite2d: AnimatedSprite2D = $AnimatedSprite2D
var state: PlayerState
var direction: float

func _ready() -> void:
	state = $IdleState
	state.enter()

func _physics_process(delta: float) -> void:
	direction = Input.get_axis("move_left", "move_right")

	var pastState = state
	state = state.update(delta)
	if(pastState != state):
		pastState.exit()
		state.enter()
