require_relative './application_controller.rb'
require_relative '../service/docker_service.rb'

class HealthCheckController < ApplicationController
  @docker_service = DockerSercice.new()

  get '/status' do
    return @docker_service.get_status(request)
  end
end
