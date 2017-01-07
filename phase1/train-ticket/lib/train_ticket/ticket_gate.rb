
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
      # TODO: 入場できない場合に例外を発生させる。
      return ticket.enter_to!(@station)
    end

    # TODO:
    # def leave(ticket)
    # end

    def leave!(ticket)
      # TODO: 出場できない場合に例外を発生させる。
      return nil # TODO: 出場したチケットを返す。
    end
  end
end
