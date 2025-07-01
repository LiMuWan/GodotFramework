extends Node

func _ready():
	# 初始化配置系统
	ConfigSystem.get_instance().initialize()
	
	# 获取配置
	var tb_characterskillsconfig = ConfigSystem.get_tables().tb_characterskillsconfig.get_by_id(1)
	var tb_equipmentconfig = ConfigSystem.get_tables().tb_equipmentconfig.get_by_id(1)
	# 输出配置信息
	print("TbCharacterSkillsConfig data = " + str(tb_characterskillsconfig))
	print("TbCharacterSkillsConfig data = " + str(tb_equipmentconfig))
