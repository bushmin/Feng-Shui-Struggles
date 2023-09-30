extends Camera2D

func move_to(node: Node2D):
	print('WIN >>>', node, node.position)
	position = node.position
	get_tree().call_group("FURNITURE", "new_camera_position", position)
