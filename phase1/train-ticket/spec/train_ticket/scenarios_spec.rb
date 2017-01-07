
require "spec_helper"

describe TrainTicket do
  before do
    @umeda_station = TrainTicket::Station.new(name: TrainTicket::StationName::UMEDA)
    @juso_station  = TrainTicket::Station.new(name: TrainTicket::StationName::JUSO)

    @vendor_umeda = TrainTicket::TicketVendor.new(station: @umeda_station)
    @gate_umeda   = TrainTicket::TicketGate.new(station: @umeda_station)
    @gate_juso    = TrainTicket::TicketGate.new(station: @juso_station)
  end

  it "scenario1" do
    # 梅田駅の券売機で150円の普通乗車券を購入できること。
    unused_ticket = @vendor_umeda.issue_ordinary_ticket(150)
    # 未使用の普通乗車券を使って梅田駅で入場できること。
    entered_ticket = @gate_umeda.enter!(unused_ticket)
    # 入場した普通乗車券を使って十三駅で出場できること。
    @gate_juso.leave!(entered_ticket)
  end

  it "scenario11" do
    # 梅田駅の券売機で150円の普通乗車券を購入できること。
    unused_ticket = @vendor_umeda.issue_ordinary_ticket(150)
    # 未使用の普通乗車券を使って梅田駅で入場できること。
    entered_ticket1 = @gate_umeda.enter!(unused_ticket)
    # 入場済みの普通乗用車を使って梅田駅で入場できないこと。
    expect {
      @gate_umeda.enter!(entered_ticket1)
    }.to raise_error(TrainTicket::Fare::AlreadyEnteredException)
  end

  it "scenario12" do
    # 梅田駅の券売機で150円の普通乗車券を購入できること。
    unused_ticket = @vendor_umeda.issue_ordinary_ticket(150)
    # 未使用の普通乗車券を使って梅田駅で入場できること。
    entered_ticket = @gate_umeda.enter!(unused_ticket)
    # 入場した普通乗車券を使って十三駅で出場できること。
    leaved_ticket = @gate_juso.leave!(entered_ticket)
    # 出場済みの普通乗用車を使って十三駅で出場できないこと。
    expect {
      @gate_juso.leave!(leaved_ticket)
    }.to raise_error(TrainTicket::Fare::AlreadyLeavedException)
  end

  it "scenario13" do
    # 梅田駅の券売機で150円の普通乗車券を購入できること。
    unused_ticket = @vendor_umeda.issue_ordinary_ticket(150)
    # 未使用の普通乗車券を使って梅田駅で出場できないこと。
    expect {
      @gate_umeda.leave!(unused_ticket)
    }.to raise_error(TrainTicket::Fare::InvalidStateException)
  end

  describe "minimal cases" do
    it "scenario1" do
      expect(TrainTicket::Fare.validate(:umeda, :juso, 150)).to eq true
    end

    it "scenario2" do
      expect(TrainTicket::Fare.validate(:umeda, :shonai, 150)).to eq false
    end

    it "scenario3" do
      expect(TrainTicket::Fare.validate(:umeda, :shonai, 180)).to eq true
    end

    it "scenario4" do
      expect(TrainTicket::Fare.validate(:umeda, :shonai, 220)).to eq true
    end

    it "scenario5" do
      expect(TrainTicket::Fare.validate(:umeda, :okamachi, 180)).to eq false
    end

    it "scenario6" do
      expect(TrainTicket::Fare.validate(:umeda, :okamachi, 220)).to eq true
    end

    it "scenario7" do
      expect(TrainTicket::Fare.validate(:juso, :okamachi, 150)).to eq false
    end

    it "scenario8" do
      expect(TrainTicket::Fare.validate(:juso, :okamachi, 180)).to eq true
    end

    it "scenario9" do
      expect(TrainTicket::Fare.validate(:juso,   :umeda, 150)).to eq true
      expect(TrainTicket::Fare.validate(:shonai, :umeda, 150)).to eq false
      expect(TrainTicket::Fare.validate(:shonai, :umeda, 180)).to eq true
      expect(TrainTicket::Fare.validate(:shonai, :umeda, 220)).to eq true
      expect(TrainTicket::Fare.validate(:okamachi, :umeda, 180)).to eq false
      expect(TrainTicket::Fare.validate(:okamachi, :umeda, 220)).to eq true
      expect(TrainTicket::Fare.validate(:okamachi, :juso, 150)).to eq false
      expect(TrainTicket::Fare.validate(:okamachi, :juso, 180)).to eq true
    end

    it "scenario10" do
      expect {
        TrainTicket::Fare.validate(:umeda, :umeda, 150)
      }.to raise_error(TrainTicket::Fare::SameStationException)
    end
  end
end
