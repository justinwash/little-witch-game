extends Node2D
export(NodePath) var CALENDAR

onready var calendar = get_node(CALENDAR)

func interact():
	if calendar.TIME == "NIGHT":
		calendar.next_day()
		calendar.set_daytime()
	
