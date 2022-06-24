module Config
  # prepare
  # add root to search path
  require 'pathname'
  ROOT_DIR = Pathname.new('.') # 可以获得执行时候的目录
  $LOAD_PATH.unshift(ROOT_DIR) unless $LOAD_PATH.include?(ROOT_DIR)

  class << self
    def loads(load_paths)
      if load_paths.instance_of?(String)
        load_paths = [load_paths]
      end
      load_paths = load_paths.map { |s| "./#{s}" }
      ignores = []
      load_paths -= ignores

      load_paths.each do |setup_step|
        target = (ROOT_DIR.realpath + setup_step)
        if target.extname == '.rb'
          require target
        else
          # TODO 这在无差别载入其实会有问题
          target.glob("./**/*.rb").sort.uniq.each do |f|
            require f
          end
        end
      end
    end

    def get_entry_name(app_name)
      app_name.split("_").map { |n| n.capitalize }.join()
    end

    def mount_app(app_name)
      self.loads("#{app_name}/app.rb")
    end

    def load_tasks
      self.loads(['config/tasks'])
    end

    def prepare(load_modular = ['setting', 'logger', 'database'])
      if load_modular.include? 'setting'
        # setting
        # load setting
        require_relative '../setting'
      end

      if load_modular.include? 'loggger'
        # load logger
        require_relative './log_man'

      end

      if load_modular.include? 'database'
        # load database
        require_relative './database'
      end
    end
  end
end

Config.prepare