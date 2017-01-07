
require "spec_helper"

describe TrainTicket::TicketVendor do
  describe "#initialize" do
    it "stores station name" do
      a = TrainTicket::Station.new(name: :a)
      b = TrainTicket::Station.new(name: :b)
      expect(TrainTicket::TicketVendor.new(station: a).station).to eq a
      expect(TrainTicket::TicketVendor.new(station: b).station).to eq b
    end
  end

  describe "#issue_ordinary_ticket" do
    it "returns ordinary tickets" do
      station1 = TrainTicket::Station.new(name: :station1)
      station2 = TrainTicket::Station.new(name: :station2)
      vendor1  = TrainTicket::TicketVendor.new(station: station1)
      vendor2  = TrainTicket::TicketVendor.new(station: station2)
      ticket1 = vendor1.issue_ordinary_ticket(1)
      expect(ticket1.issued_station).to be station1
      expect(ticket1.type).to eq :ordinary
      expect(ticket1.price).to eq 1
      ticket2 = vendor2.issue_ordinary_ticket(2)
      expect(ticket2.issued_station).to be station2
      expect(ticket2.type).to eq :ordinary
      expect(ticket2.price).to eq 2
    end
  end
end
