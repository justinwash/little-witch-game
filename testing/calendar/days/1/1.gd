extends "res://testing/calendar/day.gd"

func day_start():
	.day_start()
	events.get_node("Arrival").trigger()
