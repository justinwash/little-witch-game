extends Node2D
export(NodePath) var TIME_CONTROLLER

onready var time_controller = get_node(TIME_CONTROLLER)

func interact():
	time_controller.set_night()
	
