PROJECT = "hello"
VERSION = "1.0.0"

sys = require("sys")

-- 设置 GPIO 引脚为输出模式，假设 LED 连接在 GPIO 2
local led_pin = 2
gpio.setup(led_pin, gpio.OUTPUT)

-- 定义一个函数来切换 LED 状态
function toggle_led()
    -- 读取当前 LED 状态
    local current_state = gpio.read(led_pin)
    
    -- 切换 LED 状态（如果是亮的，关闭；如果是灭的，打开）
    if current_state == gpio.LOW then
        gpio.write(led_pin, gpio.HIGH)  -- 点亮 LED
        print("LED is ON")
    else
        gpio.write(led_pin, gpio.LOW)   -- 熄灭 LED
        print("LED is OFF")
    end
end

-- 每秒切换一次 LED 状态
sys.timerLoopStart(toggle_led, 1000)

-- 启动 sys.run 来开始系统调度
sys.run()
