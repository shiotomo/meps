require 'time'

class TimeConverter
  MYSQL_TIMESTAMP_FORMAT = "%Y-%m-%d %H:%M:%S"
  DATE_REGEXP_FORMAT = /^\d{4}-\d{1,2}-\d{1,2}$/
  DATE_TIME_REGEXP_FORMAT = /^\d{4}-\d{1,2}-\d{1,2}\s\d{2}:\d{2}:\d{2}$/

  def initialize(date_str)
    @date_str = date_str
  end

  # MySQLのtimestampか判定する
  def self.is_mysql_time_stamp(date_str)
    if DATE_REGEXP_FORMAT === date_str
      return true
    end
    if DATE_TIME_REGEXP_FORMAT === date_str
      return true
    end
    return false
  end

  # MySQLのtimestamp型に変換する
  def to_mysql_time_stamp
    # 日時のフォーマットが違う場合nilを返却する
    return nil unless TIME_REGEXP_FORMAT === @date_str
    begin
      date_time = DateTime.parse(@date_str)
      return date_time.strftime(MYSQL_TIMESTAMP_FORMAT)
    rescue => exception
      return nil
    end
  end

  # Time型に変換する
  def to_time
    begin
      time = Time.parse(@date_str)
      return time
    rescue => exception
      return nil
    end
  end

  # DateTime型に変換する
  def to_date_time
    begin
      time = DateTime.parse(@date_str)
      return time
    rescue => exception
      return nil
    end
  end
end