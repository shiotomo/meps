require_relative './common/mysql_client'

class OperationLog
  class << self
    # 全operation_logを取得する
    def get_operation_log
      client = MysqlClient.new
      query = "SELECT id, caused_at, level, log, created_at FROM operation_log"
      result = client.run_query(query)
      result_list = []
      result.each do |entry|
        result_list.push(entry)
      end
      return result_list
    end

    def get_operation_log_where_date
    end
  end
end