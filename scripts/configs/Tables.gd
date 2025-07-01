extends RefCounted

class_name Tables

var tb_characterconfig: TbCharacterConfig
var tb_equipmentconfig: TbEquipmentConfig
var tb_characterskillsconfig: TbCharacterSkillsConfig

func _init(loader):
	tb_characterconfig = TbCharacterConfig.new(loader.call("CharacterConfig"))
	tb_equipmentconfig = TbEquipmentConfig.new(loader.call("EquipmentConfig"))
	tb_characterskillsconfig = TbCharacterSkillsConfig.new(loader.call("CharacterSkillsConfig"))

func get_tb_characterconfig() -> TbCharacterConfig:
	return tb_characterconfig

func get_tb_equipmentconfig() -> TbEquipmentConfig:
	return tb_equipmentconfig

func get_tb_characterskillsconfig() -> TbCharacterSkillsConfig:
	return tb_characterskillsconfig
