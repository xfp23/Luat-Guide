# **Lua 函数**  

在 Lua 中，函数是一等公民（First-Class），可以像变量一样赋值、传递和返回。Lua 提供了多种定义和调用函数的方式，包括匿名函数、闭包、可变参数等特性。  

---

## **1. 定义和调用函数**
### **1.1 基本函数**
使用 `function` 关键字定义函数：
```lua
function sayHello()
    print("你好，Lua！")
end

sayHello()  -- 调用函数，输出: 你好，Lua！
```

### **1.2 带参数的函数**
```lua
function greet(name)
    print("你好，" .. name .. "！")
end

greet("张三")  -- 输出: 你好，张三！
```

### **1.3 带返回值的函数**
```lua
function add(a, b)
    return a + b
end

local sum = add(10, 20)
print(sum)  -- 输出: 30
```

---

## **2. 变量作用域**
Lua 的变量作用域分为 **全局变量** 和 **局部变量**：
```lua
local function example()
    local x = 10  -- 局部变量
    print(x)
end

example()
print(x)  -- 报错: x 是局部变量，无法在函数外部访问
```

如果不加 `local`，变量会变成全局变量：
```lua
function setGlobalVar()
    y = 100  -- 全局变量
end

setGlobalVar()
print(y)  -- 输出: 100
```

---

## **3. 变量作为函数**
Lua 允许将函数赋值给变量：
```lua
local func = function()
    print("我是一个匿名函数！")
end

func()  -- 输出: 我是一个匿名函数！
```

---

## **4. 可变参数（Vararg）**
使用 `...` 处理可变参数：
```lua
function sum(...)
    local total = 0
    for _, v in ipairs({...}) do
        total = total + v
    end
    return total
end

print(sum(1, 2, 3, 4, 5))  -- 输出: 15
```

---

## **5. 多返回值**
Lua 的函数可以返回多个值：
```lua
function getValues()
    return 10, 20, 30
end

a, b, c = getValues()
print(a, b, c)  -- 输出: 10  20  30
```

---

## **6. 闭包（Closure）**
Lua 支持闭包，函数可以捕获外部变量：
```lua
function counter()
    local count = 0
    return function()
        count = count + 1
        return count
    end
end

local c = counter()
print(c())  -- 输出: 1
print(c())  -- 输出: 2
print(c())  -- 输出: 3
```

---

## **7. 递归函数**
```lua
function factorial(n)
    if n == 0 then
        return 1
    else
        return n * factorial(n - 1)
    end
end

print(factorial(5))  -- 输出: 120
```

---

## **8. 高阶函数**
函数可以作为参数传递：
```lua
function applyFunction(func, x, y)
    return func(x, y)
end

print(applyFunction(add, 5, 10))  -- 输出: 15
```

---

## **9. 总结**
- Lua 中函数可以有参数、返回值、闭包和递归。
- `local` 关键字用于定义局部变量，避免污染全局命名空间。
- `...` 允许函数接受可变数量的参数。
- 多返回值可以用 `a, b = func()` 形式接收。
- 函数可以作为变量赋值、传递和返回，实现高阶函数功能。

Lua 的函数系统灵活强大，合理使用可以提高代码的可读性和复用性。