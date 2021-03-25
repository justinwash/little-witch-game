extends Node2D
export(NodePath) var CALENDAR

onready var calendar = get_node(CALENDAR)

func interact():
	if calendar.current_day.day_should_end():
		print("quests complete. switching to night time")
		calendar.set_nighttime()
	else:
		print("quests incomplete. staying in day time")
	
