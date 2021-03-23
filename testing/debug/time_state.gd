extends Label

export(NodePath) var TIME_CONTROLLER

onready var time_controller = get_node(TIME_CONTROLLER)

func _physics_process(_delta):
	text = "time state: " + time_controller.TIME
