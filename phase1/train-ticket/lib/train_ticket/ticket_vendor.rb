
module TrainTicket
  class TicketVendor
    def initialize(station_name:)
      # TODO: 妥当な駅名かどうか検証する。
      @station_name = station_name
    end

    attr_reader :station_name

    def issue_ordinary_ticket(price)
      return nil # TODO:
    end
  end
end
