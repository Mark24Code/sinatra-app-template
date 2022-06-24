module Config
  module Setting
    class BaseConfig
      class << self
        def set(keyname, value)
          instance_eval(<<-CODE
            @#{keyname}=#{value.inspect}
            
            def #{keyname}
              @#{keyname}
            end

            def #{keyname}=(val)
              @#{keyname}=val
            end
            
            def #{keyname}?
              !!#{keyname.inspect}
            end
          CODE
          )
        end
        def configure(&block)
          instance_eval(&block)
        end

        def development?
          ENV.fetch('APP_ENV'){ 'development' } == 'development'
        end
        def test?
          ENV['APP_ENV'] == 'test'
        end
        def production?
          ENV['APP_ENV'] == 'production'
        end
      end
    end

    class Production < BaseConfig
    end

    class Development < Production
    end

    class Test < Development
    end

    class << self
      def current
        env = ENV.fetch('APP_ENV'){ 'development' }
        return Object.const_get("Config::Setting::#{env.capitalize}")
      end
    end
  end
end