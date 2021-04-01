extends Node2D

export(NodePath) var CALENDAR
export(NodePath) var CURRENT_QUEST
export(String) var TASK_NAME
export(NodePath) var DIALOG_OVERLAY
export(NodePath) var PLAYER

onready var calendar = get_node(CALENDAR)
onready var current_quest = get_node(CURRENT_QUEST)
onready var dialog_overlay = get_node(DIALOG_OVERLAY)
onready var player = get_node(PLAYER)

func interact():
	var new_dialog = Dialogic.start('DrewDay1')
	new_dialog.connect("dialogic_signal", player, "set_can_interact")
	dialog_overlay.add_child(new_dialog)
