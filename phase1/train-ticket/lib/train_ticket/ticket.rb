
module TrainTicket
  # 切符を表現するクラス。
  class Ticket
    def initialize(station:, price:)
      @issued_station = station
      @type           = :ordinary
      @price          = price
      # TODO: 発行日時
    end

    attr_reader :issued_station, :type, :price
  end
end
