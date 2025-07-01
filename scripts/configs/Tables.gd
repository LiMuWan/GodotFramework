extends RefCounted

class_name Tables

var _tb_character_skills_config: TbCharacterSkillsConfig

# 初始化，接收加载函数引用
func _init(loader):
	# 加载角色技能配置
	var content = loader.call("CharacterSkillsConfig")
	_tb_character_skills_config = TbCharacterSkillsConfig.new(content)
	
func get_tb_character_skills_config() -> TbCharacterSkillsConfig:
	return _tb_character_skills_config
