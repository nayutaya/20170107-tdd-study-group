
require "spec_helper"

describe TrainTicket::StationName do
  it "has station name constants" do
    expect(TrainTicket::StationName::UMEDA).to eq :umeda
    expect(TrainTicket::StationName::JUSO).to  eq :juso
  end
end
