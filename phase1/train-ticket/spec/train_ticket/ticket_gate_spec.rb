
require "spec_helper"

describe TrainTicket::TicketGate do
  before do
    @station1 = TrainTicket::Station.new(name: :station1)
    @station2 = TrainTicket::Station.new(name: :station2)
    @gate1 = TrainTicket::TicketGate.new(station: @station1)
    @gate2 = TrainTicket::TicketGate.new(station: @station2)
  end

  describe "#initialize" do
    it "returns new ticket gate" do
      gate = TrainTicket::TicketGate.new(station: @station1)
      expect(gate.station).to be @station1
    end
  end

  describe "#enter!" do
    # TODO:
  end

  describe "#leave!" do
    # TODO:
  end
end
