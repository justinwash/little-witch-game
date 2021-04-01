extends "res://testing/player/states/State.gd"


func enter(player):
	.enter(player)

func update(player, delta):
	if Input.is_action_pressed("ui_right") || \
	Input.is_action_pressed("ui_left") || \
	Input.is_action_pressed("ui_up") || \
	Input.is_action_pressed("ui_down"):
		emit_signal("change_state", "walk")
	
	if Input.is_action_just_pressed("player_interact") && player.can_interact:
		emit_signal("change_state", "interact")
