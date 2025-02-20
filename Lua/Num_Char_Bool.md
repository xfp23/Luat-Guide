# 数字、字符和布尔类型

Lua 主要支持三种基本数据类型：**数字（number）**、**字符串（string）** 和 **布尔值（boolean）**。它们在程序中广泛用于计算、文本处理和逻辑控制。

---

## **1. 数字（Number）**
### **1.1 数字类型简介**
Lua 只有一种数字类型，即 **number**，它通常是双精度浮点数（IEEE 754），但在某些平台或配置下可以支持整数类型。

```lua
local a = 10      -- 整数
local b = 3.14    -- 浮点数
local c = 1e3     -- 科学计数法（等于 1000）
local d = 0x1A    -- 十六进制（等于 26）
print(a, b, c, d) -- 输出: 10  3.14  1000  26
```

### **1.2 数字运算**
Lua 提供了常见的算术运算符：
| 运算符 | 说明  | 示例 |
|--------|------|------|
| `+`    | 加法  | `3 + 2 → 5` |
| `-`    | 减法  | `5 - 3 → 2` |
| `*`    | 乘法  | `4 * 2 → 8` |
| `/`    | 除法  | `10 / 2 → 5.0` |
| `//`   | 取整除 | `10 // 3 → 3` |
| `%`    | 取模  | `10 % 3 → 1` |
| `^`    | 幂运算 | `2 ^ 3 → 8` |

```lua
local x = 10
local y = 3
print(x + y, x - y, x * y, x / y, x // y, x % y, x ^ y)
-- 输出: 13  7  30  3.3333  3  1  1000
```

### **1.3 类型转换**
- `tonumber(s)` 可用于将字符串转换为数字，若转换失败返回 `nil`。
- 数字自动转换为字符串时，以最紧凑的形式表示。

```lua
local num = tonumber("123")  -- 转换成功
print(num, type(num))  -- 输出: 123  number

local invalid = tonumber("abc")  -- 转换失败
print(invalid)  -- 输出: nil
```

---

## **2. 字符串（String）**
### **2.1 字符串定义**
Lua 的字符串可以用单引号 `'` 或双引号 `"` 以及 `[[ ]]`（长字符串）来表示。

```lua
local s1 = "Hello"
local s2 = 'World'
local s3 = [[Lua 是一种轻量级脚本语言]]
print(s1, s2, s3)
```

### **2.2 字符串连接**
Lua 使用 `..` 进行字符串拼接。

```lua
local name = "Lua"
local version = "5.4"
print("Welcome to " .. name .. " " .. version)  -- 输出: Welcome to Lua 5.4
```

### **2.3 字符串长度**
使用 `#` 计算字符串长度。

```lua
local text = "Hello, Lua!"
print(#text)  -- 输出: 11
```

### **2.4 字符串常用方法**
Lua 提供 `string` 库进行字符串操作：
```lua
local str = "Lua Programming"
print(string.upper(str))  -- 转换为大写: LUA PROGRAMMING
print(string.lower(str))  -- 转换为小写: lua programming
print(string.sub(str, 1, 3))  -- 截取字符串: Lua
print(string.find(str, "Pro"))  -- 查找子串: 5 7
print(string.reverse(str))  -- 反转字符串: gnimmargorP auL
```

---

## **3. 布尔值（Boolean）**
### **3.1 布尔类型简介**
Lua 只有 **true** 和 **false** 两个布尔值，主要用于控制流判断。

```lua
local a = true
local b = false
print(a, b)  -- 输出: true  false
```

### **3.2 布尔运算**
| 运算符 | 说明  | 示例 |
|--------|------|------|
| `and`  | 逻辑与 | `true and false → false` |
| `or`   | 逻辑或 | `true or false → true` |
| `not`  | 逻辑非 | `not true → false` |

```lua
print(true and false)  -- 输出: false
print(true or false)   -- 输出: true
print(not true)        -- 输出: false
```

### **3.3 布尔值的判断**
- `nil` 和 `false` 视为 **假**。
- 其他所有值（包括 `0` 和 `""`）均视为 **真**。

```lua
if 0 then
    print("0 被视为真")
end
if "" then
    print("空字符串也被视为真")
end
```
**输出：**
```
0 被视为真
空字符串也被视为真
```

---

## **4. 变量类型检查**
Lua 提供 `type()` 函数来获取变量类型：
```lua
print(type(10))        -- 输出: number
print(type("Hello"))   -- 输出: string
print(type(true))      -- 输出: boolean
print(type(nil))       -- 输出: nil
```

---

## **5. 综述**
- **数字**（number）支持整数和浮点数，常用于数学计算。
- **字符串**（string）用于存储和处理文本，支持拼接、查找、截取等操作。
- **布尔值**（boolean）用于逻辑判断，`true` 和 `false` 是 Lua 中的布尔类型。
- **`nil` 和 `false` 视为假，其余所有值都为真**，包括 `0` 和 `""`。

---

