
module TrainTicket
  # 駅名に関するモジュール。
  module StationName
    [
      ["umeda", "梅田"],
      ["juso",  "十三"],
    ].each { |id, ja_name|
      self.const_set(id.upcase.intern, id.intern)
    }
  end
end
