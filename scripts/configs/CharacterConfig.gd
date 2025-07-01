extends BaseEntity

class_name CharacterConfig

var name: String
var speed: int
var max_speed: int
var damage: int
var crit: float

func _init(data = null):
	if data != null and data is Dictionary:
		super._init(data) # Call base class constructor to initialize 'id'
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


# Returns a string representation of the object for debugging.
func _to_string() -> String:
	var sb = ""
	sb += "--- CharacterConfig Object ---\n"
	sb += "id: " + str(id) + "\n"
	sb += "name: " + (name if name != null else "null") + "\n"
	sb += "speed: " + str(speed) + "\n"
	sb += "max_speed: " + str(max_speed) + "\n"
	sb += "damage: " + str(damage) + "\n"
	sb += "crit: " + str(crit) + "\n"
	sb += "--------------------"
	return sb
