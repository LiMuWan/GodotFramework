extends RefCounted # Or your base class

class_name CharacterConfig

var id: int
var name: String
var speed: int
var max_speed: int
var damage: int
var crit: float

func _init(data = null):
	if data != null and data is Dictionary:
		if data.has("id"):
			id = data.id
		if data.has("name"):
			name = data.name
		if data.has("speed"):
			speed = data.speed
		if data.has("max_speed"):
			max_speed = data.max_speed
		if data.has("damage"):
			damage = data.damage
		if data.has("crit"):
			crit = data.crit

