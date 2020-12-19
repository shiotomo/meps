require_relative './application_controller.rb'
require_relative '../service/minecraft_service.rb'
require_relative '../service/minecraft_log_service.rb'

class MinecraftController < ApplicationController
  @minecraft_service = MinecraftService.new()
  @minecraft_log_service = MinecraftLogService.new()

  get '/whitelist' do
    return MinecraftService.get_whitelist()
  end

  get '/ops' do
    return MinecraftService.get_ops()
  end

  get '/minecraft_log' do
    return MinecraftLogService.get_log(params[:date])
  end
end
