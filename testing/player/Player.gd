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
	print("dialog event: ", event)
	if event == "dialog_started":
		set_input_active(false)
	elif event == "dialog_ended":
		timer.wait_time = 0.5
		timer.connect("timeout", self, "set_input_active", [true])
		timer.start()
	elif event.begins_with("set_quest_active"):
		var cal = get_node("../Calendar")
		var quest_path = "../Calendar/Days/" + cal.current_day.name+ "/Quests/" + str(event.split(" ")[1])
		var quest = get_node(quest_path)
		if (quest):
			quest.active = true
			print("set ", quest_path, " active")
		else:
			print("couldn't find quest ", quest_path, " to activate")
