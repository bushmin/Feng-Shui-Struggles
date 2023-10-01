extends CanvasLayer

const IDLE_TIME = 0.5

func _ready():
	dissolve_at_once()
	#yield(get_tree().create_timer(IDLE_TIME), "timeout")
	#$AnimationPlayer.play_backwards('DISSOLVE')

func change_scene(target: String, outroSpeed = 1, introSpeed = 1) -> void:
	$AnimationPlayer.set_speed_scale(outroSpeed)
	$AnimationPlayer.play("DISSOLVE")
	
	yield($AnimationPlayer,'animation_finished')
	get_tree().change_scene(target)
	yield(get_tree().create_timer(IDLE_TIME), "timeout")
	
	$AnimationPlayer.set_speed_scale(introSpeed)
	$AnimationPlayer.play_backwards('DISSOLVE')
	yield($AnimationPlayer,'animation_finished')
	$AnimationPlayer.set_speed_scale(1)
	
func dissolve_at_once():
	$AnimationPlayer.play_backwards('DISSOLVE')
	$AnimationPlayer.advance(1)

