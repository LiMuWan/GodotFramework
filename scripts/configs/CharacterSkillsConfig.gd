extends BaseEntity

class_name CharacterSkillsConfig

var name: String
var skills: Array
var max_speed: int
var damage: int
var crit: float
var skill_cooldowns: Array
var skill_costs: Array
var skill_types: Array
var is_available: bool

func _init(data = null):
	if data != null and data is Dictionary:
		super._init(data) # Call base class constructor to initialize 'id'
		if data.has("name"):
			name = data.name
		if data.has("skills"):
			skills = data.skills
		if data.has("max_speed"):
			max_speed = data.max_speed
		if data.has("damage"):
			damage = data.damage
		if data.has("crit"):
			crit = data.crit
		if data.has("skill_cooldowns"):
			skill_cooldowns = data.skill_cooldowns
		if data.has("skill_costs"):
			skill_costs = data.skill_costs
		if data.has("skill_types"):
			skill_types = data.skill_types
		if data.has("is_available"):
			is_available = data.is_available


# Returns a string representation of the object for debugging.
func _to_string() -> String:
	var sb = ""
	sb += "--- CharacterSkillsConfig Object ---\n"
	sb += "id: " + str(id) + "\n"
	sb += "name: " + (name if name != null else "null") + "\n"
	var skills_str = "null"
	if skills != null and skills.size() > 0:
		skills_str = ", ".join(skills)
	sb += "skills: " + skills_str + "\n"
	sb += "max_speed: " + str(max_speed) + "\n"
	sb += "damage: " + str(damage) + "\n"
	sb += "crit: " + str(crit) + "\n"
	var skill_cooldowns_str = "null"
	if skill_cooldowns != null and skill_cooldowns.size() > 0:
		skill_cooldowns_str = ", ".join(skill_cooldowns.map(str))
	sb += "skill_cooldowns: " + skill_cooldowns_str + "\n"
	var skill_costs_str = "null"
	if skill_costs != null and skill_costs.size() > 0:
		skill_costs_str = ", ".join(skill_costs.map(str))
	sb += "skill_costs: " + skill_costs_str + "\n"
	var skill_types_str = "null"
	if skill_types != null and skill_types.size() > 0:
		skill_types_str = ", ".join(skill_types)
	sb += "skill_types: " + skill_types_str + "\n"
	sb += "is_available: " + str(is_available) + "\n"
	sb += "--------------------"
	return sb

