
require "spec_helper"

describe TrainTicket do
  it "scenario1" do
    # TODO: StationNameをStationクラスに変更する。
    vendor_umeda = TrainTicket::TicketVendor.new(station_name: TrainTicket::StationName::UMEDA)
    gate_umeda   = TrainTicket::TicketGate.new(station_name: TrainTicket::StationName::UMEDA)
    gate_juso    = TrainTicket::TicketGate.new(station_name: TrainTicket::StationName::JUSO)

    # 150円の普通乗車券を発券する
    unused_ticket = vendor_umeda.issue_ordinary_ticket(150)
    # 梅田駅で入場する。
    #entered_ticket, enter_result = gate_umeda.enter(unused_ticket)
    #entered_ticket = gate_umeda.enter!(unused_ticket)
    # 十三駅で出場する。
    #used_ticket, leave_result = gate_juso.leave(entered_ticket)
    #used_ticket = gate_juso.leave!(entered_ticket)
  end
end
