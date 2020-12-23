require_relative '../dao/minecraft_log_dao.rb'

class MinecraftLogService
  def initialize
    @minecraft_log_dao = MinecraftLogDao.new()
  end

  def get_log(date)
    return date == nil ? @minecraft_log_dao.get_all().to_json() : @minecraft_log_dao.get_where_date(date).to_json()
  end
end
