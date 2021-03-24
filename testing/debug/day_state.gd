extends Label

export(NodePath) var CALENDAR

onready var calendar = get_node(CALENDAR)

func _physics_process(_delta):
	text = "current day: " + calendar.current_day.name
