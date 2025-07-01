class_name CharacterSkillsConfig extends BaseEntity

var name: String
var skills: Array = []
var max_speed: int
var damage: int
var crit: float
var skill_cooldowns: Array = []
var skill_costs: Array = []
var skill_types: Array = []
var is_available: bool

func _init(data = null):
	# 如果 BaseEntity 有构造函数需要调用
	if data != null:
		super._init(data)  # 调用父类构造函数
	
	# 初始化自身属性
	 # 初始化自身属性
	if data != null and data is Dictionary:
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

# 返回对象的字符串表示，用于调试
func _to_string() -> String:
	var sb = ""
	sb += "--- CharacterSkillsConfig Object ---\n"
	sb += "id: " + str(id) + "\n"  # 确保 BaseEntity 中定义了 id 属性
	sb += "name: " + (name if name != null else "null") + "\n"
	
	var skills_str = "null"
	if skills.size() > 0:
		skills_str = ", ".join(skills)  # 确保 skills 是一个数组或列表
	sb += "skills: " + skills_str + "\n"
	
	sb += "max_speed: " + str(max_speed) + "\n"
	sb += "damage: " + str(damage) + "\n"
	sb += "crit: " + str(crit) + "\n"
	
	var cooldowns_str = "null"
	if skill_cooldowns.size() > 0:
		cooldowns_str = ", ".join(skill_cooldowns.map(str))  # 使用 map 函数进行转换
	sb += "skill_cooldowns: " + cooldowns_str + "\n"
	
	var costs_str = "null"
	if skill_costs.size() > 0:
		costs_str = ", ".join(skill_costs.map(str))  # 使用 map 函数进行转换
	sb += "skill_costs: " + costs_str + "\n"
	
	var types_str = "null"
	if skill_types.size() > 0:
		types_str = ", ".join(skill_types)  # 确保 skill_types 是一个数组或列表
	sb += "skill_types: " + types_str + "\n"
	
	sb += "is_available: " + str(is_available) + "\n"
	sb += "--------------------"
	return sb
