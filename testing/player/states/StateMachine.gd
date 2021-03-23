extends "res://testing/player/states/FiniteStateMachine.gd"

class_name StateMachine

func _ready():
	states = {
		"idle": $Idle,
		"walk": $Walk,
		"interact": $Interact
	}
