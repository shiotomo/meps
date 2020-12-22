require_relative '../dao/access_log_dao.rb'
require_relative '../dao/minecraft_setting_file_dao.rb'

class AccessLogService
  def initialize
    @access_log_dao = AccessLogDao.new()
  end

  # access_logを取得する
  def get_log(date)
    return date == nil ? @access_log_dao.get_all().to_json() : @access_log_dao.get_where_date(date).to_json()
  end

  # 現在ログインしているアカウントのhashを返却する
  def get_access_count_where_now
    access_log = @access_log_dao.get_all_order_by_asc()
    login_accounts = get_init_login_accounts()
    access_log.each do |access|
      log = access["log"]
      name = log.split(" ")[0]
      access = log.include?("joined the game") ? "login" : "logout"
      accounts[:"#{name}"] = true if access == "login"
      accounts[:"#{name}"] = false if access == "logout"
    end
    return login_accounts.to_json()
  end

  def get_access_count
    access_log = @access_log_dao.get_all_order_by_asc()
    login_accounts = get_init_login_count_accounts()
    access_log.each do |access|
      log = access["log"]
      name = log.split(" ")[0]
      access = log.include?("joined the game") ? "login" : "logout"
      accounts[:"#{name}"] += 1 if access == "login"
    end
    return login_accounts.to_json()
  end

  private
  def get_init_login_accounts
    return get_accounts_hash(false)
  end

  def get_init_login_count_accounts
    return get_accounts_hash(0)
  end

  def get_accounts_hash(init_value)
    whitelist = MinecraftSettingFileDao.get_whitelist()
    accounts = {}
    whitelist.each do |account|
      accounts[:"#{account["name"]}"] = init_value
    end
    return accounts
  end
end
