extends BaseEntity

class_name EquipmentConfig

var name: String
var type: String
var rarity: String
var power: int
var level_required: int

func _init(data = null):
	if data != null and data is Dictionary:
		super._init(data) # Call base class constructor to initialize 'id'
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


# Returns a string representation of the object for debugging.
func _to_string() -> String:
	var sb = ""
	sb += "--- EquipmentConfig Object ---\n"
	sb += "id: " + str(id) + "\n"
	sb += "name: " + (name if name != null else "null") + "\n"
	sb += "type: " + (type if type != null else "null") + "\n"
	sb += "rarity: " + (rarity if rarity != null else "null") + "\n"
	sb += "power: " + str(power) + "\n"
	sb += "level_required: " + str(level_required) + "\n"
	sb += "--------------------"
	return sb

