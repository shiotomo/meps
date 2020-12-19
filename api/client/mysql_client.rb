require 'mysql2'

class MysqlClient
  def initialize
    @connection = Mysql2::Client.new(
      host: ENV['MYSQL_HOST'],
      port: ENV['MYSQL_PORT'],
      username: ENV['MYSQL_USER'],
      password: ENV['MYSQL_PASSWORD'],
      database: ENV['MYSQL_DATABASE']
    )
    @connection.query('set character set utf8')
  end

  # クエリを実行する
  def run_query(query)
    result = @connection.query(query)
    return result
  end

  def run_query_where_param(query, param)
  end
end