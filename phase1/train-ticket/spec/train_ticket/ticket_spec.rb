
require "spec_helper"

describe TrainTicket::Ticket do
  describe "#initialize" do
    it "returns new ticket which has valid price" do
      ticket1 = TrainTicket::Ticket.new(0)
      expect(ticket1.type).to eq :ordinary
      expect(ticket1.price).to eq 0
      ticket2 = TrainTicket::Ticket.new(1)
      expect(ticket2.price).to eq 1
    end
  end
end
