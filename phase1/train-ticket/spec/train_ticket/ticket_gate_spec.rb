
require "spec_helper"

describe TrainTicket::TicketGate do
  before do
    @station1 = TrainTicket::Station.new(name: :station1)
  end

  describe "#initialize" do
    it "returns a new ticket gate" do
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
