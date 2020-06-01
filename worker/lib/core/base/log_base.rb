class LogBase
  ERROR_MESSAGE = {status: "Invalid date format."}

  class << self
    # ログを取得する
    def get_log
      raise 'call abstract method.'
    end

    private
    # 指定したqueryのログを取得する
    def get_log_query(query)
      client = MysqlClient.new
      result = client.run_query(query)
      result_list = []
      result.each do |entry|
        result_list.push(entry)
      end
      return result_list
    end
  end
end