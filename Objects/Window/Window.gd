extends KinematicBody2D

export var BREAKABLE = false

var broken = false

func _on_collider_body_entered(body: KinematicBody2D):
	if BREAKABLE and not broken and body.name != 'Window4' and body.name != 'Window5':
		$TextureRect.hide()
		$CollisionShape2D.set_deferred('disabled', true)
		MusicManager.SFX.play_glass()
		broken = true
		$CPUParticles2D.restart()
