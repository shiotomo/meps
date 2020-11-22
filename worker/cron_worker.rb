require 'clockwork'
include Clockwork

require_relative './lib/core/minecraft'
require_relative './config/environment'

# 実行時は/appから始まるため./からスタート
log_file_path = './logs/meps_cron_worker.log'

File.open(log_file_path, 'w') unless File.exist?(log_file_path)
@logger = Logger.new(log_file_path)

# Minecraft Server バックアップ
# every(5.seconds, 'server_back_up') do
# TODO: API経由でバックアップを行う
every(1.days, 'server_back_up', at: '00:00') do
  mes = Minecraft.world_backup(ENV['MINECRAFT_VERSION'], './minecraft', './backup')
  @logger.info(mes)
end
