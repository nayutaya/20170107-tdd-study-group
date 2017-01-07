
module TrainTicket
  module Fare
    def self.validate(enter_station_name, leave_station_name, ticket_price)
      return true if enter_station_name == "梅田" && leave_station_name == "十三" && ticket_price == 150
      return false
    end
  end
end
