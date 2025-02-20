# **Lua 控制语句**

Lua 提供了多种控制语句来控制程序的流程，主要包括 **条件语句**、**循环语句** 和 **跳转语句**。这些控制语句使得 Lua 在逻辑判断、迭代和跳转等方面非常灵活。

---

## **1. 条件语句**
条件语句用于根据不同的条件执行不同的代码块。

### `if` 语句
`if` 语句用于执行基于条件的代码块。

```lua
if condition then
    -- 如果 condition 为 true，执行此代码
end
```

### `if...else` 语句
`else` 用于在条件为 `false` 时执行另一段代码。

```lua
if condition then
    -- 如果 condition 为 true，执行此代码
else
    -- 如果 condition 为 false，执行此代码
end
```

### `if...elseif...else` 语句
`elseif` 用于多个条件的判断。相当于多个 `if` 的组合。

```lua
if condition1 then
    -- 如果 condition1 为 true，执行此代码
elseif condition2 then
    -- 如果 condition2 为 true，执行此代码
else
    -- 如果所有条件都为 false，执行此代码
end
```

**示例：**
```lua
local x = 10
if x > 0 then
    print("Positive")
elseif x < 0 then
    print("Negative")
else
    print("Zero")
end
```

---

## **2. 循环语句**
循环语句用于重复执行一段代码，直到满足特定的条件。

### `while` 循环
`while` 循环在条件为 `true` 时持续执行代码块。

```lua
while condition do
    -- 当 condition 为 true 时，执行此代码
end
```

**示例：**
```lua
local count = 1
while count <= 5 do
    print(count)
    count = count + 1
end
```

### `repeat...until` 循环
`repeat...until` 循环至少执行一次代码块，然后根据条件是否为 `true` 来决定是否继续执行。

```lua
repeat
    -- 执行代码
until condition
```

**示例：**
```lua
local count = 1
repeat
    print(count)
    count = count + 1
until count > 5
```

### `for` 循环
`for` 循环用于指定次数的循环，可以是数值型的或泛型的。

#### 数值型 `for` 循环
```lua
for i = start, stop, step do
    -- 执行代码
end
```
- `start`：起始值
- `stop`：结束值
- `step`：步长（可选，默认为 1）

**示例：**
```lua
for i = 1, 5 do
    print(i)
end
```

#### 泛型 `for` 循环
用于迭代表中的元素，通常与 `pairs()` 或 `ipairs()` 配合使用。

```lua
for key, value in pairs(table) do
    -- 执行代码
end
```

**示例：**
```lua
local fruits = { "apple", "banana", "cherry" }
for index, fruit in ipairs(fruits) do
    print(index, fruit)
end
```

---

## **3. 跳转语句**

### `break`
`break` 语句用于退出循环，不再执行后续的迭代。

**示例：**
```lua
for i = 1, 10 do
    if i == 5 then
        break
    end
    print(i)
end
```

### `return`
`return` 用于从函数中返回值并结束函数执行。

```lua
return [value]
```

**示例：**
```lua
function add(a, b)
    return a + b
end
print(add(5, 3))  -- 输出: 8
```

### `goto`
`goto` 语句用于跳转到指定标签位置，但一般不推荐使用，因为它会使代码变得难以理解。

```lua
::label::
-- 代码
goto label
```

**示例：**
```lua
local i = 1
::start::
if i <= 5 then
    print(i)
    i = i + 1
    goto start
end
```

---

## **4. 综合示例：控制语句**
```lua
local num = 5
if num > 0 then
    print("Number is positive")
elseif num == 0 then
    print("Number is zero")
else
    print("Number is negative")
end

for i = 1, 3 do
    print("Loop iteration:", i)
end

local i = 1
repeat
    print("Repeat loop:", i)
    i = i + 1
until i > 3
```

---

## **总结**

- **条件语句**：`if`, `elseif`, `else` 用于根据不同条件执行不同代码。
- **循环语句**：`while`, `repeat...until`, `for` 用于循环执行代码。
- **跳转语句**：`break` 用于退出循环，`return` 用于函数返回，`goto` 用于跳转到标签位置。

合理使用控制语句可以有效地控制代码流，处理不同的逻辑情况。