require "api_report"

describe ApiReport do
  describe "::new" do
    subject { described_class.new(:success, "Woo!") }

    it "creates a new ApiReport with status and message" do
      expect(subject).to_not be_nil
    end
  end

  describe "#to_s" do
    subject { described_class.new(:success, "Woo!") }

    it "reports the status and message" do
      expect(subject.to_s).to eq("Status: success\nWoo!")
    end
  end

  describe "#from_http_response" do
    context "http response not ok" do
      let :http_response { double(:http_response, ok?: false, message: "Error") }
      subject { described_class.from_http_response(http_response) }

      it "reports failure" do
        expect(subject.to_s).to match(/Status: failed/)
      end

      it "reports message" do
        expect(subject.to_s).to match(/Error/)
      end
    end

    context "http response ok" do
      let :http_response { double(:http_response, ok?: true, body: "Woo") }
      subject { described_class.from_http_response(http_response) }

      it "reports failure" do
        expect(subject.to_s).to match(/Status: success/)
      end

      it "reports message" do
        expect(subject.to_s).to match(/Woo/)
      end
    end
  end

  describe "#failure" do
    let :failure_message { "Oh no" }
    subject { described_class.failure(failure_message) }

    it "reports failure" do
      expect(subject.to_s).to match(/Status: failed/)
    end

    it "reports message" do
      expect(subject.to_s).to match(/Oh no/)
    end
  end
end
