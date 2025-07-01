class_name ConfigSystem
extends Node  # 继承 Node 或其他适当的基类

var _tables = null
var _is_initialized = false

const JSON_CONFIG_PATH = "res://resources/configs/json_configs/"
const CSV_CONFIG_PATH = "res://resources/configs/csv_configs/"

# 使用静态方法代替 C# 中的静态类
static func get_instance() -> ConfigSystem:
	if Engine.has_singleton("ConfigSystem"):
		return Engine.get_singleton("ConfigSystem")
	
	# 创建实例并确保它不为空
	var instance = ConfigSystem.new()
	if instance == null:
		push_error("Failed to create ConfigSystem instance")
		return null
		
	# 注册单例
	Engine.register_singleton("ConfigSystem", instance)
	return instance

# 获取配置表，懒加载初始化
static func get_tables():
	var instance = get_instance()
	if instance == null:  # 添加 null 检查
		push_error("Failed to get ConfigSystem instance")
		return null
		
	if not instance._is_initialized:
		instance.initialize()
	return instance._tables

# 初始化配置系统
func initialize():
	if _is_initialized:
		return
		
	_tables = Tables.new(Callable(self, "load_json"))
	_is_initialized = true
	print("ConfigSystem initialized successfully.")
		
# 加载 JSON 配置文件
func load_json(file_name: String) -> String:
	return load_config_file(JSON_CONFIG_PATH, file_name,".json")
	
# 加载 CSV 配置文件
func load_csv(file_name: String) -> String:
	return load_config_file(CSV_CONFIG_PATH, file_name,".csv")
	
# 通用配置文件加载方法
func load_config_file(base_path: String, file_name: String,file_extension:String) -> String:
	if file_name.is_empty():
		push_error("File name cannot be null or empty")
		return ""
	var resource_manager:UIResourceManager = UIResourceManager.new()
	# Load resource
	var full_path = base_path + file_name + file_extension
	var file = resource_manager.load_resource(full_path)	
	var content = str(file.data)
	return content
