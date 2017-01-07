
require "spec_helper"

describe TrainTicket::Ticket do
  describe "#initialize" do
    it "returns new ticket which has valid price" do
      station1 = TrainTicket::Station.new(name: :station1)
      station2 = TrainTicket::Station.new(name: :station2)
      ticket1 = TrainTicket::Ticket.new(station: station1, price: 1)
      expect(ticket1.issued_station).to be station1
      expect(ticket1.type).to eq :ordinary
      expect(ticket1.price).to eq 1
      ticket2 = TrainTicket::Ticket.new(station: station2, price: 2)
      expect(ticket2.issued_station).to be station2
      expect(ticket2.type).to eq :ordinary
      expect(ticket2.price).to eq 2
    end
  end
end
