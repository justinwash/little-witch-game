extends "res://testing/player/states/State.gd"

func enter(player):
	.enter(player)
	
	var object_to_interact = getNearestInteractable(player)
	if object_to_interact:
		print("interacting with " + str(object_to_interact.name))
		object_to_interact.interact()
	
	emit_signal("change_state", "idle")

func getNearestInteractable(player):
	var interactables = get_tree().get_nodes_in_group("Interactable")
	var distances = []
	for interactable in interactables:
		if interactable:
			var distanceToActor = interactable.position.distance_to(player.position)
	
			if(distanceToActor < 50):
				distances.append({"interactable":interactable, "distance":distanceToActor})
	
	if distances.size() > 0:
		var minDistance = 1000
		var interactable
		for pair in distances:
			if pair.distance < minDistance:
				interactable = pair.interactable
				minDistance = pair.distance
		return interactable
		
	return null
