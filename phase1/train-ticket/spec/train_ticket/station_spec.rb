
require "spec_helper"

describe TrainTicket::Station do
  describe "#initialize" do
    it "returns a new station" do
      station1 = TrainTicket::Station.new(name: :a)
      expect(station1.name).to eq :a
      station2 = TrainTicket::Station.new(name: :b)
      expect(station2.name).to eq :b
    end
  end
end
