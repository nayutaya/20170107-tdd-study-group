
require "spec_helper"

describe TrainTicket::Ticket do
  before do
    @station1 = TrainTicket::Station.new(name: :umeda)
    @station2 = TrainTicket::Station.new(name: :juso)
  end

  describe "#initialize" do
    it "returns a new ticket which has valid price" do
      ticket1 = TrainTicket::Ticket.new(station: @station1, price: 1)
      expect(ticket1.issued_station).to be @station1
      expect(ticket1.type).to eq :ordinary
      expect(ticket1.price).to eq 1

      ticket2 = TrainTicket::Ticket.new(station: @station2, price: 2)
      expect(ticket2.issued_station).to be @station2
      expect(ticket2.type).to eq :ordinary
      expect(ticket2.price).to eq 2
    end
  end

  describe "enter_to!" do
    it "TODO 1" do
      ticket1 = TrainTicket::Ticket.new(station: @station1, price: 1000)
      expect(ticket1.entered_at).to eq nil
      ticket2 = ticket1.enter_to!(@station1)
      expect(ticket2.entered_at).to be @station1
    end

    it "TODO 2" do
      ticket1 = TrainTicket::Ticket.new(station: @station1, price: 1000)
      ticket2 = ticket1.enter_to!(@station1)
      ticket3 = ticket2.leave_from!(@station2)
      expect {
        ticket3.enter_to!(@station1)
      }.to raise_error(TrainTicket::Fare::AlreadyLeavedException)
    end
  end

  describe "leave_from!" do
    it "TODO 1" do
      ticket1 = TrainTicket::Ticket.new(station: @station1, price: 1000)
      ticket2 = ticket1.enter_to!(@station1)
      ticket3 = ticket2.leave_from!(@station2)
      expect(ticket3.leaved_at).to be @station2
    end

    it "TODO 2" do
      ticket1 = TrainTicket::Ticket.new(station: @station1, price: 1000)
      expect {
        ticket1.leave_from!(@station2)
      }.to raise_error(TrainTicket::Fare::InvalidStateException)
    end

    it "TODO 3" do
      ticket1 = TrainTicket::Ticket.new(station: @station1, price: 1000)
      ticket2 = ticket1.enter_to!(@station1)
      ticket3 = ticket2.leave_from!(@station2)
      expect {
        ticket3.leave_from!(@station2)
      }.to raise_error(TrainTicket::Fare::AlreadyLeavedException)
    end
  end
end
