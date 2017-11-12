require "httparty"
require_relative "./api_report"

class ApiRequest
  API_SERVER_HOST = "http://67.205.138.167/"

  def initialize(path, params, api_report_class=ApiReport)
    @path = path
    @params = params
    @api_report_class = api_report_class
  end

  def report
    response = make_request
    if response.is_a? HTTParty::Response
      api_report_class.from_http_response(response)
    else
      api_report_class.failure(response.to_s)
    end
  end

  private

  def make_request
    begin
      HTTParty.get(URI.join(API_SERVER_HOST, path), query: params)
    rescue *REQUEST_EXCEPTIONS => e
      e
    end
  end

  REQUEST_EXCEPTIONS = [Timeout::Error,
                        Errno::EINVAL,
                        Errno::ECONNRESET,
                        Errno::ENETUNREACH,
                        EOFError,
                        Net::HTTPBadResponse,
                        Net::HTTPHeaderSyntaxError,
                        Net::ProtocolError]

  attr_reader :path, :params, :api_report_class
end
