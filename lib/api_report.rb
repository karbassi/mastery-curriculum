class ApiReport
  def initialize(status, message)
    @status = status
    @message = message
  end

  def to_s
    "Status: #{status}\n" \
    "#{message}"
  end

  def self.from_http_response(response)
    return self.failure(response.message) if !response.ok?
    new(:success, response.body)
  end

  def self.failure(failure_message)
    new(:failed,
        "Error: #{failure_message}\n" \
        "Please report this error to maryrosecook.")
  end

  private

  attr_reader :status, :message
end
