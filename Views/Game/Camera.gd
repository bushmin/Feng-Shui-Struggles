extends Camera2D

const OFFSET = Vector2(-200, -50)

func move_to(node: Node2D):
	print('WIN >>>', node, node.position)
	position = node.position + OFFSET
	get_tree().call_group("FURNITURE", "new_camera_position", position)
