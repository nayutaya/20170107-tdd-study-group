
module TrainTicket
  # 改札機を表現するクラス。
  class TicketGate
    def initialize(station:)
      @station = station
    end

    attr_reader :station

    # TODO:
    # def enter(ticket)
    # end

    def enter!(ticket)
      return ticket.enter_to!(@station)
    end

    # TODO:
    # def leave(ticket)
    # end

    def leave!(ticket)
      return ticket.leave_from!(@station)
    end
  end
end
