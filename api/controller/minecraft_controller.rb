require_relative './application_controller.rb'
require_relative '../service/minecraft_service.rb'
require_relative '../service/minecraft_log_service.rb'

class MinecraftController < ApplicationController
  before do
    @minecraft_service = MinecraftService.new()
    @minecraft_log_service = MinecraftLogService.new()
  end

  get '/whitelist' do
    return @minecraft_service.get_whitelist()
  end

  get '/ops' do
    return @minecraft_service.get_ops()
  end

  get '/minecraft_log' do
    return @minecraft_log_service.get_log(params[:date])
  end
end
