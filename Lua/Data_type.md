# Lua 数据类型

## 1. 数据类型概述
Lua 是一种轻量级、嵌入式的脚本语言，提供了简单而强大的数据类型系统。Lua 的数据类型非常简洁，主要包括以下几种基础类型：

- **nil**
- **boolean**
- **number**
- **string**
- **table**
- **function**
- **userdata**
- **thread**

其中，**table** 是 Lua 中非常重要且强大的数据结构，几乎所有的数据集合（如数组、字典、集合等）都可以使用 table 来表示。

---

## 2. **nil 类型**
- **nil** 是 Lua 中的一个特殊类型，用于表示“无”或“空”。
- 在 Lua 中，**nil** 表示没有值，通常用于标记变量未初始化或函数的无返回值。
- **nil** 在 Lua 中是唯一的类型，任何未初始化的变量或者使用 `table.remove()` 删除的表项的值都会变为 **nil**。

### 示例：
```lua
local x = nil
print(x)  -- 输出: nil
```

---

## 3. **boolean 类型**
- **boolean** 类型只有两个值：`true` 和 `false`。
- 在 Lua 中，`false` 和 `nil` 被认为是逻辑上的“假”（falsy），其余的值都被视为“真”（truthy）。

### 示例：
```lua
local isTrue = true
local isFalse = false

if isTrue then
    print("This is true!")
end

if not isFalse then
    print("This is false!")
end
```

---

## 4. **number 类型**
- Lua 中的 **number** 类型用于表示数字，Lua 使用双精度浮点数（即 `double`）来表示所有的数字（包括整数和浮点数）。
- 在 Lua 中没有区分整数和浮点数，所有数字都归类为 **number** 类型。
- Lua 提供了数学库 `math`，提供了常见的数学运算函数。

### 示例：
```lua
local integer = 42       -- 整数
local float = 3.14       -- 浮点数
local sum = integer + float
print(sum)  -- 输出: 45.14
```

---

## 5. **string 类型**
- **string** 是 Lua 中的字符串类型，支持用双引号 `"` 或单引号 `'` 来表示字符串。
- 字符串是不可变的，一旦创建就无法更改，可以用来存储文本。
- Lua 支持字符串的拼接、长度计算、子字符串操作等。

### 示例：
```lua
local str1 = "Hello"
local str2 = 'World'
local greeting = str1 .. " " .. str2  -- 字符串拼接
print(greeting)  -- 输出: Hello World
```

### 字符串操作：
- `#str`：获取字符串长度。
- `string.sub(str, start, end)`：获取字符串的子字符串。

```lua
local name = "Lua"
print(#name)  -- 输出: 3
print(string.sub(name, 1, 2))  -- 输出: Lu
```

---

## 6. **table 类型**
- **table** 是 Lua 中最重要的数据结构，用于表示数组、字典、集合等各种类型的集合数据。
- 在 Lua 中，表（table）可以通过键（key）和值（value）来存储数据。
- Lua 的数组是通过数字作为键来实现的，字典则是通过任意类型的值作为键来实现的。

### 示例：
```lua
local array = {1, 2, 3, 4, 5}  -- 数组
print(array[1])  -- 输出: 1

local dict = {name = "Lua", version = "5.1"}  -- 字典
print(dict["name"])  -- 输出: Lua
print(dict.version)  -- 输出: 5.1
```

### 表的操作：
- 使用 `table.insert(table, value)` 可以向表中插入元素。
- 使用 `table.remove(table, index)` 可以删除表中的元素。

---

## 7. **function 类型**
- **function** 类型用于表示 Lua 中的函数。
- Lua 的函数是“一等公民”，即函数也是可以传递的值，可以作为参数传递或赋值给变量。

### 示例：
```lua
local function greet(name)
    print("Hello, " .. name)
end

greet("Lua")  -- 输出: Hello, Lua
```

### 匿名函数：
```lua
local sum = function(a, b)
    return a + b
end

print(sum(3, 4))  -- 输出: 7
```

---

## 8. **userdata 类型**
- **userdata** 类型用于表示在 Lua 中创建的外部数据结构。通常与 C 语言接口相关，可以在 Lua 中存储 C 数据。
- `userdata` 主要用于与 C/C++ 的接口交互，通常用于底层资源管理。

### 示例：
```lua
local obj = new_userdata()  -- 假设存在创建外部数据结构的函数
```

---

## 9. **thread 类型**
- **thread** 是 Lua 中的一个特殊数据类型，用于表示协程（coroutine）。协程是一种轻量级的线程，可以在 Lua 中并发执行任务。
- 在 Lua 中，线程主要用于协程的调度，允许程序并行执行多个任务。

### 示例：
```lua
local co = coroutine.create(function()
    for i = 1, 5 do
        print(i)
        coroutine.yield()  -- 暂停执行
    end
end)

coroutine.resume(co)
coroutine.resume(co)
coroutine.resume(co)  -- 输出: 1 2 3
```

---

## 10. **总结**
Lua 提供了非常简单且灵活的数据类型系统。除了基本的数据类型，如 **nil**、**boolean**、**number**、**string**、**function** 等，**table** 是最强大和灵活的数据结构，它可以用于实现各种数据集合。Lua 的数据类型系统设计得很简洁且高效，适合嵌入式编程和脚本应用开发。

--- 
