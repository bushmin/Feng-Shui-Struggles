extends KinematicBody2D

export var BREAKABLE = false

func _on_collider_body_entered(body: KinematicBody2D):
	if BREAKABLE and body.name != 'Window4' and body.name != 'Window5':
		$TextureRect.hide()
		$CollisionShape2D.set_deferred('disabled', true)
