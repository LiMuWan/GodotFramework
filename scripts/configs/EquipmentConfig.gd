extends RefCounted # Or your base class

class_name EquipmentConfig

var id: int
var name: String
var type: String
var rarity: String
var power: int
var level_required: int

func _init(data = null):
	if data != null and data is Dictionary:
		if data.has("id"):
			id = data.id
		if data.has("name"):
			name = data.name
		if data.has("type"):
			type = data.type
		if data.has("rarity"):
			rarity = data.rarity
		if data.has("power"):
			power = data.power
		if data.has("level_required"):
			level_required = data.level_required

