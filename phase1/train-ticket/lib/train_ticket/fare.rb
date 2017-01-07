
module TrainTicket
  module Fare
    def self.validate(enter_station_name, leave_station_name, ticket_price)
      if enter_station_name == :umeda
        return true if leave_station_name == :juso && ticket_price == 150
        return true if leave_station_name == :shonai && ticket_price == 180
      end
      return false
    end
  end
end
