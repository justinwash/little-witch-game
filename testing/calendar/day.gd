extends Node

onready var events = $Events
onready var quests = $Quests
onready var news = $News
onready var calendar = get_node('../../')

func day_start():
	print('day ', name, ' started!' )
	print(quests.get_child(0).name)

