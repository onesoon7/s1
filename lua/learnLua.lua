-- 单行注释
--[[
    [多行注释]
--]]
 
----------
-- 1. 变量 & 控制流
----------
num = 23 -- 数字都是双精度
str = 'aspythonstring' -- 像 Python 一样不可变
str = "aspythonuse" -- 可以双引号
str = [[
        像 Python 的多行注释可用于
        表示多行字符串一样
        方便
    ]]
 
bol = nil -- 未定义；支持垃圾回收
 
-- 缩进只为易读性，像 Matlab 一样以 end 结尾
while num < 50 do
    num = num + 1 -- 没有 ++ 或 += 自增操作符号
end
 
-- IF 条件开关
if num > 40 then
    print('> 40')
elseif s ~= 'aspython' then -- ~= 表示 !=
    io.write('s is not aspython') -- 风骚的标准输出
else
    thisIsGlobal = 5 -- 驼峰式命名
    -- 显示声明局部变量（像 Javascript 一样）
    local line = io.read()
 
    -- .. 作为字符串连接符
    print('凛冬将至' .. line)
end
 
-- 引用未定义变量将返回 nil ，这不是错误
foo = anUnknownVariable  -- 等价于 foo = nil
 
aBoolValue = false
-- 只有 nil 与 false 为逻辑假； 数字 0 与空字串 '' 为真！
if not aBoolValue then print('false') end
 
-- 像 Python 一样运用 'or' 和 'and'
-- 得到 C 语言中 a ? b : c 的效果；需注意 b = false 或 nil 的情况
ans = aBoolValue and 'yes' or 'no'
 
karlSum = 0
for i = 1, 100 do -- 像 Matlab 一样的递增语法，包括两端，如同数学中[1, 100]
    karlSum = karlSum + i
end
 
-- Step 为 2 递减的方式 '100, 1, -2'
for j = 100, 1, -2 then print(j) end
 
-- 综上，范围可表示为 "begin, end [, step]"
 
-- 另一个循环控制
num = 23
repeat
    print('凡人必有一死')
    num = num - 1
until num == 0
 
 
----------
- 2. 函数
----------
function fib(n)
    if n < 2 then return 1 end
    return fib(n - 2) + fib(n - 1)
end
 
-- Javascript 一样的匿名函数与闭包
function adder(x)
    -- 返回一个函数
    -- 闭包内封存 x 值
    return function (y) return x + y end
end
a1 = adder(9)
a2 = adder(36)
print(a1(16))  --> 25
print(a2(64))  --> 100
 
-- 遇到不匹配的列表长度时
-- 过长的变量将被赋予 nil
-- 过长的值将被忽略
 
x, y, z = 1, 2, 3, 4 -- 4 将被忽略
function bar(a, b, c)
    print(a, b, c)
    return 4, 8, 15, 16, 23, 42
end
x, y = bar('zaphod')  --> "zaphod  nil nil"
-- x = 4, y = 8, 其余值被忽略
 
-- 函数与其他类型一样为一等公民
-- 同样有 local/global 之分
-- 像 Javascript 一样定义
function f(x) return x * x end
f = function (x) return x * x end
 
print 'Hello World!' -- 只有一个`字符串`参数时可省略括号
 
----------
- 3. 表(Table) 
----------
-- 表是 Lua 中唯一的复合类型
-- 像 PHP 中的数组或 Javascript 中的 Object 一样
-- 可用作 list/dict/map
 
-- 默认以字符串作为 key
t = {key1 = 'value1', key2 = false}
-- 像 Javascript 一样以 . 取值
print(t.key1) --> "value1"
t.key3 = {} -- 加入新的键值对
t.key2 = nil -- 销毁一组键值对
 
-- 理论上任何非 nil 的变量都可以作为 key
u = {['@!#'] = 'qbert', [{}] = 1729, [6.28] = 'tau'}
print(u[6.28])  --> "tau"
a = u['@!#'] -- a = 'qbert'
b = u[{}] -- b = nil；像 Javascript 一样 {} 会创建新的对象
          -- 因此不要用蛋疼的 key 值，老老实实用字串或数字
 
-- 同字符串一样，只有一个表作为函数的参数时可以省略括号
-- 为了一个括号增加阅读难度，得不偿失
function h(x) print(x.key1) end
h{key1 = 'Sonmi~451'}  --> "Sonmi~451"
 
for key, val in pairs(u) do  -- 像 Python  一样的键值迭代
    print(key, val)
end
 
-- 像 Javascript 一样的全局作用域 _G
print(_G['_G'] == _G) --> true
 
-- 省略 key 之后即可变身为 list
-- 实际上是以递增自然数为 key
v = {'value1', 'value2', 1.21, 'gigawatts'}
for i = 1, #v do  -- 像 Bash 一样，#v 表示列表长度
    print(v[i])  -- 像 Matlab 一样，列表索引从 1 开始
end
 
----------
- 3.1 Metatables & metamethods
----------
-- 元表(metatable)就是表的表，像 Javascript 的原型(prototype)一样
-- 为表重载一些元方法(metamethods)
 
f1 = {a = 1, b = 2}
f2 = {a = 2, b = 3}
-- s = f1 + f2 为错
 
mm = {}
function mm.__add(x, y)
  sum = {}
  sum.a = x.a + y.a
  sum.b = x.b + y.b
  return sum
end
 
setmetatable(f1, mm)
setmetatable(f2, mm)
 
-- 实际调用 f1 的 metatable 中的 __add(f1, f2)
-- 只为 f1 设置元表也可以
s = f1 + f2 -- s = {a = 3, b = 5}
 
-- s2 = s + s 为错，s 未定义元表
 
-- __index 元方法重载表中 key 的提取符号 `.`
defaultFavs = {animal = 'gru', food = 'donuts'}
myFavs = {food = 'pizza'}
setmetatable(myFavs, {__index = defaultFavs})
food = myFavs.food
 
-- Lua 中的值都具有元方法，只有 Table 可以重载
-- 所有元方法如下
 
-- __add(a, b)                     for a + b
-- __sub(a, b)                     for a - b
-- __mul(a, b)                     for a * b
-- __div(a, b)                     for a / b
-- __mod(a, b)                     for a % b
-- __pow(a, b)                     for a ^ b
-- __unm(a)                        for -a
-- __concat(a, b)                  for a .. b
-- __len(a)                        for #a
-- __eq(a, b)                      for a == b
-- __lt(a, b)                      for a < b
-- __le(a, b)                      for a <= b
-- __index(a, b)  <fn or a table>  for a.b
-- __newindex(a, b, c)             for a.b = c
-- __call(a, ...)                  for a(...)
 
----------
- 3.2 类风格的 Table 与继承
----------
 
-- 像 Javascript 一样并没有内置 Class
-- 但可以通过 Table `{}` 实现
 
Dog = {}                                -- 1.
function Dog:new()                      -- 2.
    newObj = {sound = 'woof'}           -- 3.
    self.__index = self                 -- 4.
    return setmetatable(newObj, self)   -- 5.
end
function Dog:makeSound()                -- 6.
    print('I say ' .. self.sound)
end
 
mrDog = Dog:new()                       -- 7.
mrDog:makeSound() --> "I say woof"
 
-- 1. Dog 像类但实际是 Table
-- 2. Dog:new(...) := Dog.new(self, ...)
-- 3. newObj 作 Dog 的实例
-- 4. self 是 Lua 中默认的参数，在这里 self = Dog
--    继承的时候可以改变
--    self.__index 与 self 的元方法 __index 不是一回事
--    self = {__index = self, metatable = {__index = ...}}
-- 5. setmetatable(newObj, self) 相当于 setmetatable(newObj, {__index = self})
--    赋予实例所有类方法
-- 6. 同 2.
-- 7. mrDog = Dog.new(Dog)
 
-- 继承
LoudDog = Dog:new()
function LoudDog:makeSound()
    s = self.sound .. ' '
    print(s .. s .. s)
end
seymour = LoudDog:new()
seymour:makeSound() --> "woof woof woof"
 
----------
- 4. 模块
----------
 
-- 以下来自文件 mod.lua
local M = {}
 
local function sayMyName()
    print('Hrunkner')
end
 
function M.sayHello()
    print('Why hello there')
    sayMyName()
end
return M
-- 以上
-- 回到主文件
local mod = require('mod') -- 运行 mod.lua 中的代码
-- 操作同下
local mod = (function()
    -- 像 Javascript 一样
    --[[
        mod.lua 中的代码
    ]]--
end)()
 
mod.sayHello() --> "Why hello there"
mod.sayMyName() --> 错！sayMyName() 是 mod.lua 中的局部变量
 
-- require 返回的值将被缓存
-- 即使多次调用 require 被调用文件也只运行一次
 
-- mod2.lua 包含 print("mod2")
local a = require("mod2") --> "mod2"
local b = require("mod2") -- 不输出， 实际为 b = a
 
-- dofile 是不缓存的版本的 require
dofile("mod2") --> "mod2"
dofile("mod2") --> "mod2"
 
-- loadfile 读取文件但不执行
-- 勘误：f = loadfile('mod2')，需加后缀名，否则找不到文件
f = loadfile('mod2.lua')
f() --> "mod2"
 
-- loadstring 读取代码字符串
f = loadstring("print('Lua is cool!')")
f() --> "Lua is cool!"
 
----------
- 5. 参考，略
----------

