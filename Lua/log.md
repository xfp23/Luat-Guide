# **Lua 日志信息（Logging）指南**  

在 Lua 中，日志（log）对于调试和跟踪程序执行非常重要。日志可以帮助开发者记录程序的状态、错误信息、性能数据等，方便排查问题和优化代码。  

---

## **1. 基本日志输出**
Lua 主要使用 `print()` 函数进行日志输出。  

### **1.1 `print()` 基础用法**
```lua
print("程序启动")  -- 输出: 程序启动
print("变量值:", 123)  -- 输出: 变量值: 123
```
`print()` 适用于简单调试，但它缺乏时间戳、日志级别等功能。  

---

## **2. 日志级别**
为了更好地管理日志，通常将日志分为不同级别，例如：
- **DEBUG**（调试信息）
- **INFO**（普通信息）
- **WARNING**（警告）
- **ERROR**（错误信息）

### **2.1 自定义日志函数**
```lua
function log(level, message)
    local time = os.date("%Y-%m-%d %H:%M:%S")
    print(string.format("[%s] [%s]: %s", time, level, message))
end

log("INFO", "程序启动")    -- [2025-02-20 14:30:00] [INFO]: 程序启动
log("ERROR", "发生错误")   -- [2025-02-20 14:30:01] [ERROR]: 发生错误
```
---

## **3. 使用 `io.write()` 将日志写入文件**
在生产环境中，通常需要将日志写入文件，而不是仅仅在控制台输出。

### **3.1 追加日志到文件**
```lua
function logToFile(level, message)
    local file = io.open("log.txt", "a")  -- 以追加模式打开文件
    if file then
        local time = os.date("%Y-%m-%d %H:%M:%S")
        file:write(string.format("[%s] [%s]: %s\n", time, level, message))
        file:close()
    end
end

logToFile("INFO", "应用已启动")
logToFile("ERROR", "无法连接数据库")
```
这会在 `log.txt` 文件中写入：
```
[2025-02-20 14:30:00] [INFO]: 应用已启动
[2025-02-20 14:30:01] [ERROR]: 无法连接数据库
```
---

## **4. 使用 `syslog`（适用于嵌入式 Lua）**
如果使用 **LuatOS**（合宙 Lua），推荐使用 `log.info()` 进行日志记录。

### **4.1 在 LuatOS 设备上打印日志**
```lua
local log = require("log")

log.info("系统", "启动成功")
log.warn("网络", "连接较慢")
log.error("系统", "发生异常")
```
输出：
```
[INFO] 系统: 启动成功
[WARN] 网络: 连接较慢
[ERROR] 系统: 发生异常
```
---

## **5. 过滤日志级别**
可以设置不同的日志级别，避免输出不必要的信息。例如，只显示 `ERROR` 及以上级别的日志：

```lua
LOG_LEVELS = { DEBUG = 1, INFO = 2, WARNING = 3, ERROR = 4 }
CURRENT_LOG_LEVEL = LOG_LEVELS.INFO  -- 只显示 INFO 及以上的日志

function log(level, message)
    local time = os.date("%Y-%m-%d %H:%M:%S")
    if LOG_LEVELS[level] >= CURRENT_LOG_LEVEL then
        print(string.format("[%s] [%s]: %s", time, level, message))
    end
end

log("DEBUG", "这是调试信息")  -- 不会打印
log("INFO", "程序启动")      -- 会打印
log("ERROR", "发生错误")     -- 会打印
```
---

## **6. 结论**
- `print()` 适用于简单日志，但功能有限。
- `log(level, message)` 可以实现带时间戳的日志格式。
- `io.write()` 允许将日志写入文件，适用于长期存储和分析。
- `log.info()` 适用于 **LuatOS** 设备，推荐在嵌入式环境使用。
- 通过设置 `LOG_LEVEL`，可以控制日志的输出级别，提高调试效率。