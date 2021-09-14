1. 根据名字的命名，可以调整优先级
Dir.glob('./{setups/*.rb').sort.each { |file| require file }

2.约定

Config.current

class YouConfig << Config::Base
  你也可以自己配置
end