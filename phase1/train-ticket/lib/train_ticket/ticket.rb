
require "train_ticket/fare"

module TrainTicket
  # 切符を表現するクラス。
  class Ticket
    def initialize(station:, price:)
      @issued_station = station
      @type           = :ordinary
      @price          = price
      @entered_at     = nil
      # TODO: 発行日時
    end

    attr_reader :issued_station, :type, :price, :entered_at

    def enter_to!(station)
      unless self.entered_at.nil?
        raise TrainTicket::Fare::AlreadyEnteredException.new
      end

      new_ticket = self.dup
      new_ticket.instance_eval { @entered_at = station }
      return new_ticket
    end
  end
end
