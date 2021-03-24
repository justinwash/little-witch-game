extends Label

export(NodePath) var CALENDAR

onready var calendar = get_node(CALENDAR)

func _physics_process(_delta):
	var quest_status_string = ''
	for quest in calendar.current_day.quests.get_children():
		var task_status_string = ''
		for task in quest.tasks:
			task_status_string += ' \n \t \t \t \t' + task.name + ': ' + ('complete, ' if task.complete else 'in progress, ')
			
		quest_status_string += ' \n \t \t' + quest.name + ': ' + ('complete, ' if quest.complete else 'in progress, ') \
			+ task_status_string
	text = "today's quests: " + quest_status_string
