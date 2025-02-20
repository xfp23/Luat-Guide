# Lua 跨文件调用文档

Lua 中的跨文件调用是通过模块（module）机制实现的，使用 `require` 函数可以引入外部 Lua 文件并共享其中定义的函数、变量等。模块化编程可以使代码更具可维护性和可重用性。在本教程中，我们将学习如何在 Lua 中使用模块化机制进行跨文件调用。

## 1. 模块化概念

在 Lua 中，模块就是一个 Lua 文件，它可以包含一组功能相关的函数、变量、常量等。通过将相关代码封装到模块中，可以避免代码的重复使用，并使程序结构更加清晰。

## 2. 使用 `require` 加载模块

`require` 是 Lua 提供的用于加载模块的关键字。`require` 会加载指定路径的 Lua 文件并执行它，将文件中返回的内容返回给调用者。

### 使用方式：

```lua
local module = require("module_name")
```

- `"module_name"` 是你要加载的模块的文件名（不需要文件扩展名 `.lua`）。
- `require` 会查找该文件并返回文件中通过 `return` 返回的内容。

## 3. 创建模块

模块通常是一个 Lua 文件，返回一个包含函数、变量等内容的表。我们可以将要共享的函数、变量等放入这个表中，然后返回该表。

### 示例：模块文件 `module.lua`

```lua
-- module.lua

local M = {}  -- 创建一个表来存放模块内容

-- 定义一个函数
function M.say_hello(name)
    print("Hello, " .. name)
end

-- 定义一个变量
M.name = "Lua Module"

-- 返回模块内容
return M
```

### 解释：
1. **表 `M`**：用来存储模块的内容。在 Lua 中，表是一个非常常用的数据结构，模块的所有函数、变量等内容都会放入该表中。
2. **返回 `M`**：通过 `return M` 返回模块，这样 `require` 函数就能够获得该表并与主文件共享。

## 4. 使用模块

模块定义好后，可以在主文件中通过 `require` 来加载并使用模块中的内容。

### 示例：主文件 `main.lua`

```lua
-- main.lua

-- 加载模块
local module = require("module")

-- 调用模块中的函数
module.say_hello("World")  -- 输出：Hello, World

-- 访问模块中的变量
print(module.name)  -- 输出：Lua Module
```

### 解释：
1. **加载模块**：`local module = require("module")` 会加载 `module.lua` 文件，并将其返回的表赋值给 `module` 变量。
2. **调用模块函数**：通过 `module.say_hello("World")` 调用模块中的函数。
3. **访问模块变量**：通过 `module.name` 访问模块中的变量。

## 5. 多个函数和变量

一个模块可以包含多个函数和变量，可以在需要时随时调用或修改。

### 示例：扩展模块

```lua
-- module.lua

local M = {}

-- 定义多个函数
function M.say_hello(name)
    print("Hello, " .. name)
end

function M.say_goodbye(name)
    print("Goodbye, " .. name)
end

-- 定义多个变量
M.name = "Lua Module"
M.version = "1.0.0"

return M
```

在 `main.lua` 中可以同时调用多个函数或访问多个变量：

```lua
-- main.lua

local module = require("module")

module.say_hello("World")  -- 输出：Hello, World
module.say_goodbye("World")  -- 输出：Goodbye, World

print(module.name)  -- 输出：Lua Module
print(module.version)  -- 输出：1.0.0
```

## 6. 文件路径和查找模块

- **当前目录**：如果模块文件位于当前目录，只需要使用模块名（不需要文件扩展名）。
- **其他目录**：如果模块文件不在当前目录，需要指定模块的路径，或者修改 `package.path` 来包含文件所在目录。

### 示例：修改 `package.path` 添加额外路径

```lua
-- 修改 package.path
package.path = package.path .. ";/path/to/your/modules/?.lua"

-- 加载模块
local module = require("module")
```

这样可以加载指定路径中的模块。

## 7. 错误处理

使用 `require` 时，如果找不到指定的模块，Lua 会抛出错误。可以使用 `pcall` 来处理加载模块时的错误。

```lua
local status, module = pcall(require, "module")

if status then
    module.say_hello("World")
else
    print("模块加载失败！")
end
```

`pcall` 会捕获错误并返回一个状态值。`status` 为 `true` 时表示加载成功，`false` 时表示加载失败。

## 总结

- **模块**：Lua 中的模块是通过 Lua 文件返回一个包含函数、变量等内容的表来实现的。
- **`require`**：`require` 用于加载并返回模块中的内容，可以在不同文件之间共享代码。
- **跨文件调用**：通过 `require` 可以实现文件之间的函数调用和变量访问，从而达到代码复用的目的。
- **模块路径**：模块的路径可以通过修改 `package.path` 来调整，方便加载不同目录中的模块。

这种模块化的编程方式能够使你的 Lua 项目更加组织化和高效。