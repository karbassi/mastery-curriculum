require "api_request"

describe ApiRequest do
  let :path { "/hi" }
  let :params { { a: "b" } }
  let :api_report_class { double(:api_report_class) }

  describe "::new" do
    subject { described_class.new(path, params, api_report_class) }

    it "creates a new ApiRequest with a path and params" do
      expect(subject).to_not be_nil
    end
  end

  describe "#report" do
    subject { described_class.new(path, params, api_report_class) }

    context "successful request" do
      before(:each) do
        stub_request(:get, /67.205.138.167\/hi/)
          .with(query: params).to_return(status: 200)
      end

      it "creates ApiReport with the http response" do
        expect(api_report_class)
          .to receive(:from_http_response)
                .with(an_instance_of(HTTParty::Response))

        subject.report
      end
    end

    context "unsuccessful request" do
      before(:each) do
        stub_request(:get, /67.205.138.167\/hi/).with(query: params).to_timeout
      end

      it "creates ApiReport failure with the exception message" do
        expect(api_report_class)
          .to receive(:failure)
          .with("execution expired")

        subject.report
      end
    end
  end
end
