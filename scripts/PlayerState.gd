@abstract
class_name PlayerState
extends Node

@onready var player: CharacterBody2D = get_parent()

@abstract
func enter() -> void

@abstract
func exit() -> void

@abstract
func update(_delta: float) -> PlayerState
