-- 程序基本信息
PROJECT = "hello"
VERSION = "1.0.0"

sys = require("sys")

-- 设置 GPIO 引脚为输出模式，假设 LED 连接在 GPIO 2
local led_pin = 2
gpio.setup(led_pin, gpio.OUTPUT)

-- 使用局部变量和全局变量
local toggle_interval = 1000  -- 切换时间间隔，单位为毫秒
local led_state = false  -- LED 的状态，false 为关，true 为开

-- 定义一个函数来切换 LED 状态
function toggle_led()
    -- 读取当前 LED 状态
    local current_state = gpio.read(led_pin)
    
    -- 如果当前状态为关闭，则打开；如果当前状态为打开，则关闭
    if current_state == gpio.LOW then
        gpio.write(led_pin, gpio.HIGH)  -- 点亮 LED
        print("LED is ON")
        led_state = true
    else
        gpio.write(led_pin, gpio.LOW)   -- 熄灭 LED
        print("LED is OFF")
        led_state = false
    end
end

-- 条件判断
if led_state == false then
    print("LED is initially OFF")
else
    print("LED is initially ON")
end

-- 定义一个函数来控制 LED 状态的反转
function reverse_led_state()
    if led_state then
        gpio.write(led_pin, gpio.LOW)  -- 熄灭 LED
        print("LED has been turned OFF")
    else
        gpio.write(led_pin, gpio.HIGH)  -- 点亮 LED
        print("LED has been turned ON")
    end
    led_state = not led_state  -- 切换 LED 状态
end

-- 循环控制 LED 状态变化
for i = 1, 5 do  -- 循环 5 次
    print("Cycle " .. i)
    reverse_led_state()  -- 调用反转函数
    sys.wait(1000)  -- 每 1 秒切换一次
end

-- 逻辑判断：如果 LED 状态是开启，开始定时器循环
if led_state then
    -- 每秒切换一次 LED 状态
    sys.timerLoopStart(toggle_led, toggle_interval)
end

-- 使用迭代器遍历表
local leds = { "LED1", "LED2", "LED3" }
for index, led in ipairs(leds) do
    print("LED " .. index .. " name: " .. led)
end

-- 使用错误处理：模拟发生错误时捕获
local function faulty_function()
    error("Simulating an error!")
end

local success, message = pcall(faulty_function)
if not success then
    print("Caught error: " .. message)
end

-- 启动 sys.run 来开始系统调度
sys.run()
