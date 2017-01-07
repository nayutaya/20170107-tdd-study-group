
module TrainTicket
  # 券売機を表現するクラス。
  class TicketVendor
    def initialize(station:)
      @station = station
    end

    attr_reader :station

    # 普通乗車券を発券する。
    def issue_ordinary_ticket(price)
      return Ticket.new(station: @station, price: price)
    end
  end
end
