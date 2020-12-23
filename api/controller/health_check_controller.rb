require_relative './application_controller.rb'
require_relative '../service/docker_service.rb'

class HealthCheckController < ApplicationController
  before do
    @docker_service = DockerService.new()
  end

  get '/status' do
    return @docker_service.get_status(request)
  end
end
