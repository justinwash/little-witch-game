extends KinematicBody2D

const MOVE_SPEED = 125

onready var state_machine = $StateMachine

var move_dir = {
	'x': 0,
	'y': 0
}

enum Directions { UP, DOWN, LEFT, RIGHT }
var facing_dir

