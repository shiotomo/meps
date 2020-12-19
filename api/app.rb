require_relative './controller/access_controller.rb'
require_relative './controller/health_check_controller.rb'
require_relative './controller/minecraft_controller.rb'

run Rack::URLMap.new({
  '/api/v1/access' => AccessController,
  '/api/v1/minecraft' => MinecraftController,
  '/api/v1/health' => HealthCheckController
})
