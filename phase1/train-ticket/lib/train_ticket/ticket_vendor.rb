
module TrainTicket
  # 券売機を表現するクラス。
  class TicketVendor
    def initialize(station_name:)
      # TODO: 駅名から駅オブジェクトに変更する。
      @station_name = station_name
    end

    attr_reader :station_name

    def issue_ordinary_ticket(price)
      return Ticket.new(price)
    end
  end
end
