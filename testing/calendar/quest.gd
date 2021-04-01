extends Node

var tasks = {}

var active = false
var complete = false

func complete_task(task_name):
	if tasks[task_name]:
		tasks[task_name].complete = true
		
		var should_complete = true
		for task_id in tasks:
			if !tasks[task_id].complete:
				should_complete = false
				break
		
		complete = should_complete
