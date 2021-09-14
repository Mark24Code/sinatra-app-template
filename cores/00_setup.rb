# Add work directory in $LOAD_PATH
$LOAD_PATH.unshift(__dir__) unless $LOAD_PATH.include?(__dir__)

# Project directory
if !$PROJECT_DIR
  # 相对自己，绝对路径
  $PROJECT_DIR = File.expand_path(File.join(__dir__, '..'))
end

# Inject APP_ENV
if !$APP_ENV
  $APP_ENV = ENV.fetch('APP_ENV') {'development'}
end
