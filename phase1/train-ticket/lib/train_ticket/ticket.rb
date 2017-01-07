
require "train_ticket/fare"

module TrainTicket
  # 切符を表現するクラス。
  class Ticket
    def initialize(station:, price:)
      @issued_station = station
      @type           = :ordinary
      @price          = price
      @entered_at     = nil
      @leaved_at      = nil
    end

    attr_reader :issued_station, :type, :price, :entered_at, :leaved_at

    def enter_to!(station)
      unless self.leaved_at.nil?
        raise TrainTicket::Fare::AlreadyLeavedException.new
      end
      unless self.entered_at.nil?
        raise TrainTicket::Fare::AlreadyEnteredException.new
      end

      new_ticket = self.dup
      new_ticket.instance_eval { @entered_at = station }
      return new_ticket
    end

    def leave_from!(station)
      if self.entered_at.nil?
        raise TrainTicket::Fare::InvalidStateException.new
      end
      unless self.leaved_at.nil?
        raise TrainTicket::Fare::AlreadyLeavedException.new
      end

      new_ticket = self.dup
      new_ticket.instance_eval { @leaved_at = station }
      return new_ticket
    end
  end
end
