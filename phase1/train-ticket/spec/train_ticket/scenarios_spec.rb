
require "spec_helper"

describe TrainTicket do
  it "scenario1" do
    umeda_station = TrainTicket::Station.new(name: TrainTicket::StationName::UMEDA)
    juso_station  = TrainTicket::Station.new(name: TrainTicket::StationName::JUSO)

    vendor_umeda = TrainTicket::TicketVendor.new(station: umeda_station)
    gate_umeda   = TrainTicket::TicketGate.new(station: umeda_station)
    gate_juso    = TrainTicket::TicketGate.new(station: juso_station)

    # 梅田駅の券売機で150円の普通乗車券を購入する。
    unused_ticket = vendor_umeda.issue_ordinary_ticket(150)
    # expect(unused_ticket.issued_station).to be umeda_station
    # expect(unused_ticket.type).to eq :ordinary
    # expect(unused_ticket.price).to eq (150)

    # 未使用の普通乗車券を使って梅田駅で入場する。
    entered_ticket = gate_umeda.enter!(unused_ticket)

    # 入場した普通乗車券を使って十三駅で出場する。
    #used_ticket, leave_result = gate_juso.leave(entered_ticket)
    used_ticket = gate_juso.leave!(entered_ticket)
  end

  it "scenario1 minimal" do
    expect(TrainTicket::Fare.validate("梅田", "十三", 150)).to eq true
  end

  it "scenario2 minimal" do
    expect(TrainTicket::Fare.validate("梅田", "庄内", 150)).to eq false
  end
end
