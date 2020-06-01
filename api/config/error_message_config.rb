class ErrorMessageConfig
  class << self
    def 401_error
      message = {
        status: 'HTTP 401: Unauthorized.'
      }
      return message
    end

    def 403_error
      message = {
        status: 'HTTP 403: Access Denied.'
      }
      return message
    end
  end
end