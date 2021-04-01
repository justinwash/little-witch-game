extends KinematicBody2D

const MOVE_SPEED = 125

onready var timer = $Timer
onready var state_machine = $StateMachine

var move_dir = {
	'x': 0,
	'y': 0
}

enum Directions { UP, DOWN, LEFT, RIGHT }
var facing_dir

var can_interact = true
var can_move = true

func set_input_active(state):
	can_interact = state
	can_move = state

func recieve_dialog_signal(event):
	if event == "dialog_started":
		set_input_active(false)
	elif event == "dialog_ended":
		timer.wait_time = 0.5
		timer.connect("timeout", self, "set_input_active", [true])
		timer.start()

