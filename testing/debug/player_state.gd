extends Label

export(NodePath) var PLAYER

onready var player = get_node(PLAYER)

func _physics_process(_delta):
	text = "player state: " + str(player.state_machine.current_state.name)
