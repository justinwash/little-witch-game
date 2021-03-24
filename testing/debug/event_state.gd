extends Label

export(NodePath) var CALENDAR

onready var calendar = get_node(CALENDAR)

func _physics_process(_delta):
	var event_status_string = ''
	for event in calendar.current_day.events.get_children():
		event_status_string += ' \n \t \t' + event.name + ': ' + ('complete, ' if event.complete else 'pending, ')
	text = "today's events: " + event_status_string
