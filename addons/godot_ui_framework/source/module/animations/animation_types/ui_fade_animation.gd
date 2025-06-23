# ui_fade_animation.gd
@tool
extends UIAnimationType
class_name UIFadeAnimation

@export var from_alpha: float = 0.0
@export var to_alpha: float = 1.0

func create_tween(target: Node) -> Tween:
	var tween = target.create_tween()
	tween.set_ease(ease_type)
	tween.set_trans(trans_type)
	if play_delay > 0:
		tween.set_delay(play_delay)
	tween.tween_property(target, "modulate:a", to_alpha, duration).from(from_alpha)
	if complete_delay > 0:
		tween.tween_interval(complete_delay)
	return tween
