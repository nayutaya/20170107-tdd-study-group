
require "spec_helper"

describe TrainTicket::TicketVendor do
  describe "#initialize" do
    it "stores station name" do
      expect(TrainTicket::TicketVendor.new(station_name: :umeda).station_name).to eq :umeda
      expect(TrainTicket::TicketVendor.new(station_name: :juso ).station_name).to eq :juso
    end
  end

  describe "#issue_ordinary_ticket" do
    it "returns ordinary ticket" do
      vendor = TrainTicket::TicketVendor.new(station_name: :umeda)
    end
  end
end
