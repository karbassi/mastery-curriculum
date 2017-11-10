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
    begin
      http_response = HTTParty.get(URI.join(API_SERVER_HOST, path),
                                   query: params)
      api_report_class.from_http_response(http_response)
    rescue Timeout::Error,
           Errno::EINVAL,
           Errno::ECONNRESET,
           Errno::ENETUNREACH,
           EOFError,
           Net::HTTPBadResponse,
           Net::HTTPHeaderSyntaxError,
           Net::ProtocolError => e
      api_report_class.failure(e.to_s)
    end
  end

  private

  attr_reader :path, :params, :api_report_class
end
