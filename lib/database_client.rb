class DatabaseClient
  def def initialize
    @connection = Mysql::connect(ENV['MYSQL_HOST'], ENV['MYSQL_USER'], ENV['MYSQL_PASSWORD'], ENV['MYSQL_DATABASE'])
    @connection.query('set character set utf8')
  end

  # operation_logを取得する
  def get_operation_log
  end

  # 指定した日付より後のoperation_logを取得する
  def get_operation_log_where(date)
  end
end