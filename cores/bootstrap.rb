# Project directory
if !$PROJECT_DIR
  # 相对自己，绝对路径
  $PROJECT_DIR = File.expand_path(File.join(__dir__, '..'))
end

# Add work directory in $LOAD_PATH
$LOAD_PATH.unshift($PROJECT_DIR) unless $LOAD_PATH.include?($PROJECT_DIR)


# Inject APP_ENV
if !$APP_ENV
  $APP_ENV = ENV.fetch('APP_ENV') {'development'}
end


module Bootstrap
  class << self
    # Auto Setup
    # auto import ordered setup modules
    # you can change file name for controlling relative require order.  
    # e.g 01_first_setup, 02_next_setup
    def loads_setups(setups)
      ignores = [
        'bootstrap'
      ]

      setups.each do |setup_step|
        target_dir = File.expand_path(File.join($PROJECT_DIR,setup_step))
        Dir.glob("#{target_dir}/*.rb").sort.each do |file|
          basename = File.basename(file, ".rb")
          if !(ignores.include? basename)
            require file 
          end
        end
      end
    end

    def apps
      setups = [
        'cores',
        'configs',
        'loggers',
        'dbs',
        'models',
        'helpers',
        'bases',
        'controllers'
      ]
      self.loads_setups(setups)
    end

    def rack
      self.apps
    end

    def rake
      setups = [
        'cores',
        'configs',
        'loggers',
        'dbs',
        'models',
        'tasks'
      ]
      self.loads_setups(setups)
    end
  end
end