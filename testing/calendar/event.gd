extends Node

var complete = false

func trigger():
	print('event ', name, ' happened!')
	complete = true
