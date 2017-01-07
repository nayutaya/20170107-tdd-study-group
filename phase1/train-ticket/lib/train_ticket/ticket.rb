
module TrainTicket
  # 切符を表現するクラス。
  class Ticket
    def initialize(price)
      @type  = :ordinary
      @price = price
      # TODO: 発行日時
    end

    attr_reader :type, :price
  end
end
