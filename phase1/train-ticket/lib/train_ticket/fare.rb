
module TrainTicket
  module Fare
    SameStationException    = Class.new(StandardError)
    AlreadyEnteredException = Class.new(StandardError)
    AlreadyLeavedException  = Class.new(StandardError)
    InvalidStateException   = Class.new(StandardError)

    def self.validate(enter_station_name, leave_station_name, ticket_price)
      if enter_station_name == leave_station_name
        raise SameStationException
      end

      if enter_station_name == :umeda
        return true if leave_station_name == :juso     && ticket_price >= 150
        return true if leave_station_name == :shonai   && ticket_price >= 180
        return true if leave_station_name == :okamachi && ticket_price >= 220
      elsif enter_station_name == :juso
        return true if leave_station_name == :umeda    && ticket_price >= 150
        return true if leave_station_name == :okamachi && ticket_price >= 180
      elsif enter_station_name == :shonai
        return true if leave_station_name == :umeda    && ticket_price >= 180
      elsif enter_station_name == :okamachi
        return true if leave_station_name == :juso     && ticket_price >= 180
        return true if leave_station_name == :umeda    && ticket_price >= 220
      end
      return false
    end
  end
end
