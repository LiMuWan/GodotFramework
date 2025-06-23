# ui_move_animation.gd
@tool
extends UIAnimationType
class_name UIMoveAnimation

@export var from_position: Vector2
@export var to_position: Vector2
@export var relative: bool = false

func create_tween(target: Node) -> Tween:
	var tween = target.create_tween()
	tween.set_ease(ease_type)
	tween.set_trans(trans_type)
	if play_delay > 0:
		tween.set_delay(play_delay)
	
	var final_from = from_position
	var final_to = to_position
	if relative:
		final_from = target.position + from_position
		final_to = target.position + to_position
		
	tween.tween_property(target, "position", final_to, duration).from(final_from)
	if complete_delay > 0:
		tween.tween_interval(complete_delay)
	return tween
