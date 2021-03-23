extends "res://testing/player/states/State.gd"

func enter(player):
	.enter(player)

func update(player, delta):
	if Input.is_action_pressed("ui_right"):
		player.move_dir.x = 1
		player.facing_dir = player.Directions.RIGHT
		$"../../AnimatedSprite".play("walkright");
	elif Input.is_action_pressed("ui_left"):
		player.move_dir.x = -1
		player.facing_dir = player.Directions.LEFT
		$"../../AnimatedSprite".play("walkleft");
	else:
		player.move_dir.x = 0

	if Input.is_action_pressed("ui_up"):
		player.move_dir.y = -1
		if !Input.is_action_pressed("ui_left") && !Input.is_action_pressed("ui_right"):
			player.facing_dir = player.Directions.UP
			$"../../AnimatedSprite".play("walkup");
	elif Input.is_action_pressed("ui_down"):
		player.move_dir.y = 1
		if !Input.is_action_pressed("ui_left") && !Input.is_action_pressed("ui_right"):
			player.facing_dir = player.Directions.DOWN
			$"../../AnimatedSprite".play("walkdown");
	else:
		player.move_dir.y = 0

	player.move_and_slide(Vector2(player.move_dir.x, player.move_dir.y).normalized() * player.MOVE_SPEED, Vector2(0, -1))

	if player.move_dir.x == 0 && player.move_dir.y == 0:
		$"../../AnimatedSprite".stop();
		$"../../AnimatedSprite".set_frame(1);
		emit_signal("change_state", "idle")
