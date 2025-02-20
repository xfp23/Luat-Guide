# **Lua 数据类型：table**  

`table` 是 Lua 唯一的数据结构类型，它既可以用于实现数组，也可以用作哈希表（键值对）。在 Lua 中，`table` 既可以存储 **数值索引（数组）**，也可以存储 **字符串键（字典/哈希表）**，甚至可以混用。  

---

## **1. 创建 table**  
在 Lua 中，`table` 由 `{}`  创建：
```lua
local t = {}  -- 创建一个空表
```

可以直接在 `{}` 中初始化值：
```lua
local arr = {1, 2, 3, 4, 5}  -- 数组形式
local dict = {name = "张三", age = 22}  -- 字典形式
```

---

## **2. 访问和修改 table**
- 使用 **数组索引** 访问：
```lua
print(arr[1])  -- 输出: 1
arr[2] = 10
print(arr[2])  -- 输出: 10
```

- 使用 **键值对** 访问：
```lua
print(dict.name)  -- 输出: 张三
dict.age = 23  -- 修改值
print(dict["age"])  -- 输出: 23
```

---

## **3. table 的混合使用**
Lua `table` 可以混合索引和键值：
```lua
local t = {
    100, 200, 300,        -- 数组部分
    name = "李四",
    age = 25
}

print(t[1])    -- 输出: 100
print(t.name)  -- 输出: 李四
```

---

## **4. 遍历 table**
### **4.1 遍历数组**
```lua
for i, v in ipairs(arr) do
    print(i, v)
end
```
`ipairs()` 只遍历 **连续整数索引** 的部分。

---

### **4.2 遍历字典**
```lua
for k, v in pairs(dict) do
    print(k, v)
end
```
`pairs()` 遍历 **所有键值对**（包括字符串键和整数索引）。

---

## **5. table 长度**
使用 `#` 获取 **数组部分** 的长度：
```lua
print(#arr)  -- 输出: 5
```
对于 **键值表（字典）**，`#` 可能不准确，需要手动统计。

---

## **6. table 函数**
Lua 提供了一些操作 `table` 的方法：
```lua
table.insert(arr, 6)  -- 追加元素
print(arr[6])  -- 输出: 6

table.remove(arr, 2)  -- 删除第二个元素
```

---

## **7. table 作为函数参数和返回值**
```lua
function printTable(t)
    for k, v in pairs(t) do
        print(k, v)
    end
end

printTable({x = 1, y = 2})
```

---

## **8. table 的引用特性**
Lua 的 `table` 是 **引用类型**：
```lua
local a = {1, 2, 3}
local b = a  -- b 和 a 指向同一个 table
b[1] = 100
print(a[1])  -- 输出: 100
```

如果要复制 table，必须手动遍历：
```lua
function shallowCopy(t)
    local newTable = {}
    for k, v in pairs(t) do
        newTable[k] = v
    end
    return newTable
end
```

---

## **9. table 的元表（Metatable）**
Lua 允许为 `table` 设置元表 (`metatable`) 以扩展其行为：
```lua
local t = {x = 10}
local mt = {
    __index = function(table, key)
        return "默认值"
    end
}
setmetatable(t, mt)

print(t.y)  -- 输出: 默认值
```
---

## **10. 总结**
- `table` 既可以作为 **数组**，也可以作为 **字典**。
- `table` 是 **引用类型**，变量只是指向同一内存地址。
- `ipairs()` 适用于 **数组遍历**，`pairs()` 适用于 **字典遍历**。
- `table.insert()` 和 `table.remove()` 用于操作数组。
- `setmetatable()` 可用于扩展 `table` 的行为。

Lua 的 `table` 设计简洁强大，能够适应不同的数据结构需求！