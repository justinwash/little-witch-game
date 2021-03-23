extends "res://old/utilities/FiniteStateMachine.gd"

func _ready():
	states = {
		"idle": $Idle,
		"walk": $Walk,
		"grabbing": $Grabbing,
		"menu": $Menu,
		"attack": $Attack,
	}
