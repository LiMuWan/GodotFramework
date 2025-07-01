extends Node

func _ready():
	# 初始化配置系统
	ConfigSystem.get_instance().initialize()
	
	# 获取配置
	var config = ConfigSystem.get_tables().get_tb_character_skills_config().get_by_id(1)
	
	# 输出配置信息
	print("TbCharacterSkillsConfig data = " + str(config))
