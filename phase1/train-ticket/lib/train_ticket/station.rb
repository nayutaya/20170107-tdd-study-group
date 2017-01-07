
module TrainTicket
  # 駅を表現するクラス。
  class Station
    def initialize(name:)
      @name = name
    end

    attr_reader :name
  end
end
