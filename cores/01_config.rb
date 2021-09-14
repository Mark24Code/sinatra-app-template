module Config
  # Sets an option to the given value.  If the value is a proc,
  # the proc will be called every time the option is accessed.
  class Base
    class << self
      def define_singleton(name, content = Proc.new)
        singleton_class.class_eval do
          undef_method(name) if method_defined? name
          String === content ? class_eval("def #{name}() #{content}; end") : define_method(name, &content)
        end
      end


    def set(option, value = (not_set = true), ignore_setter = false, &block)
        raise ArgumentError if block and !not_set
        value, not_set = block, false if block

        if not_set
          raise ArgumentError unless option.respond_to?(:each)
          option.each { |k,v| set(k, v) }
          return self
        end

        if respond_to?("#{option}=") and not ignore_setter
          return __send__("#{option}=", value)
        end

        setter = proc { |val| set option, val, true }
        getter = proc { value }

        case value
        when Proc
          getter = value
        when Symbol, Integer, FalseClass, TrueClass, NilClass
          getter = value.inspect
        when Hash
          setter = proc do |val|
            val = value.merge val if Hash === val
            set option, val, true
          end
        end

        define_singleton("#{option}=", setter)
        define_singleton(option, getter)
        define_singleton("#{option}?", "!!#{option}") unless method_defined? "#{option}?"
        self
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


      def configure(&block)
        self.instance_eval(&block)
      end

    end
  end


  class Default < Base

  end

  class Development < Default
  end

  class Test < Default
  end

  class Production < Default
  end

  class << self
    def current
      env = ENV.fetch('APP_ENV'){ 'development' }
      return Object.const_get("Config::#{env.capitalize}")
    end
  end
end


