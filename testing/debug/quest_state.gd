extends Label

export(NodePath) var CALENDAR

onready var calendar = get_node(CALENDAR)

func _physics_process(_delta):
	if calendar.current_day.get_node("Quests"):
		var quest_status_string = ''
		for quest in calendar.current_day.quests.get_children():
			var task_status_string = ''
			for task_id in quest.tasks:
				task_status_string += ' \n \t \t \t \t' + task_id + ': ' + ('complete' if quest.tasks[task_id].complete else 'in progress, ')
			
			quest_status_string += ' \n \t \t' + quest.name + ': ' + ('complete' if quest.complete else 'in progress') \
				+ task_status_string
		text = "today's quests: " + quest_status_string
	else:
		set_physics_process(false) # remove this after testing
		text = "today's quests: undefined"
