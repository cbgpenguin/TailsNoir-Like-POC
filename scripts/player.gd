extends CharacterBody2D

const SPEED = 100.0 * 60 # Pixles/s
@onready var animatedSprite2d: AnimatedSprite2D = $AnimatedSprite2D
var colidedLastFrame = true
var state: PlayerState
var direction: float

func _ready() -> void:
	state = $IdleState
	state.enter()

func _physics_process(delta: float) -> void:
	var pastState = state
	state = state.update(delta)
	if(pastState != state):
		pastState.exit()
		state.enter()
	
	direction = Input.get_axis("move_left", "move_right")

func setDefaltAnimation():
	animatedSprite2d.flip_h = false
	animatedSprite2d.play("default (front face short idel)")
