extends RefCounted # Or your base class

class_name CharacterSkillsConfig

var id: int
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
		if data.has("id"):
			id = data.id
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

