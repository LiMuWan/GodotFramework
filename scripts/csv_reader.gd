# file: scripts/utils/CsvReader.gd
class_name CsvReader
extends RefCounted

## 加载指定名称的 CSV 文件，并返回其文本内容
## @param file_name: CSV 文件的名称（不包含路径和扩展名）
## @return: 文件的文本内容，如果加载失败则返回空字符串
static func load_csv_text(full_path: String) -> String:
	if full_path.is_empty():
		push_error("CsvReader: File name cannot be empty.")
		return ""
	
	# 检查文件是否存在
	if not FileAccess.file_exists(full_path):
		push_error("CsvReader: File not found at path: " + full_path)
		return ""
		
	# 打开并读取文件
	var file = FileAccess.open(full_path, FileAccess.READ)
	if file == null:
		push_error("CsvReader: Failed to open file: " + full_path)
		return ""
		
	var content = file.get_as_text()
	return content
