extends "res://old/utilities/State.gd"

const Updates = preload("Updates.gd") # Relative path

func enter():
	.enter()

	print("idle")

func update():
	if Updates.check_walk():
		emit_signal("change_state", "walk")
