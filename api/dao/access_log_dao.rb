require_relative '../client/mysql_client.rb'

class AccessLogDao
  def initialize
    @client = MysqlClient.new()
  end

  # 全ログデータを取得する
  def get_all
    query = 'SELECT id, caused_at, level, log, created_at FROM access_log'
    result = @client.run_query(query)
    return to_result_list(result)
  end

  # 指定した日付のログデータを取得する
  def get_where_date(date)
    query = "SELECT id, caused_at, level, log, created_at FROM access_log WHERE created_at >= '#{date}'"
    result = @client.run_query(query)
    return to_result_list(result)
  end

  # 作成した順番のログデータを取得する
  def get_all_order_by_asc
    query = 'SELECT id, caused_at, level, log, created_at FROM access_log ORDER BY created_at ASC'
    result = @client.run_query(query)
    return to_result_list(result)
  end

  private
  # queryの実行結果から返却用リストを作成する
  def to_result_list(result)
    result_list = []
    result.each do |entry|
      result_list.push(entry)
    end
    return result_list
  end
end
