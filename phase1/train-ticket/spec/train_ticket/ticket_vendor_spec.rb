
require "spec_helper"

describe TrainTicket::TicketVendor do
  describe "#initialize" do
    it "stores station name" do
      expect(TrainTicket::TicketVendor.new(station_name: :umeda).station_name).to eq :umeda
      expect(TrainTicket::TicketVendor.new(station_name: :juso ).station_name).to eq :juso
    end
  end

  describe "#issue_ordinary_ticket" do
    it "returns ordinary tickets" do
      vendor = TrainTicket::TicketVendor.new(station_name: :umeda)
      ticket1 = vendor.issue_ordinary_ticket(1)
      expect(ticket1.type).to eq :ordinary
      expect(ticket1.price).to eq 1
      ticket2 = vendor.issue_ordinary_ticket(2)
      expect(ticket2.type).to eq :ordinary
      expect(ticket2.price).to eq 2
    end
  end
end
