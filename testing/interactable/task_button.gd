extends Node2D

export(NodePath) var CALENDAR
export(NodePath) var QUEST
export(String) var TASK_NAME

onready var calendar = get_node(CALENDAR)
onready var quest = get_node(QUEST)

func interact():
	if quest:
		quest.complete_task(TASK_NAME)
		
