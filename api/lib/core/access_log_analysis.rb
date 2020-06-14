class AccessLogAnalysis < LogBase
  class << self
    # 現在ログインしている人のhashを返却する
    def get_access_count_where_now
      query = "SELECT id, caused_at, level, log, created_at FROM access_log ORDER BY created_at ASC"
      access_log = get_log_query(query)
      File.open("./minecraft/whitelist.json") do |f|
        @whitelist_json = JSON.load(f)
      end
      login_users = {}
      @whitelist_json.each do |account|
        login_users[:"#{account["name"]}"] = false
      end
      access_log.each do |access|
        log = access["log"]
        name = log.split(" ")[0]
        access = log.include?("joined the game") ? "login" : "logout"
        login_users[:"#{name}"] = true if access == "login"
        login_users[:"#{name}"] = false if access == "logout"
      end
      return login_users
    end

    # 今日ログインした人のアクセス数を返却する
    def get_access_count_where_today
    end

    # 指定した日付にログインした人のアクセス数を返却する
    def get_access_count_where_date(date)
    end

    # 全アカウントのログイン数を返却する
    def get_access_count
      query = "SELECT id, caused_at, level, log, created_at FROM access_log ORDER BY created_at ASC"
      access_log = get_log_query(query)
      File.open("./minecraft/whitelist.json") do |f|
        @whitelist_json = JSON.load(f)
      end
      login_users = {}
      @whitelist_json.each do |account|
        login_users[:"#{account["name"]}"] = 0
      end
      access_log.each do |access|
        log = access["log"]
        name = log.split(" ")[0]
        access = log.include?("joined the game") ? "login" : "logout"
        login_users[:"#{name}"] += 1 if access == "login"
      end
      return login_users
    end

    # 指定した名前のアカウントのログイン数を返却する
    def get_access_count_where_name(name)
    end
  end
end