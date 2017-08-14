class TimeslotSerializer < ActiveModel::Serializer
  attributes :id,:start_time, :duration, :availability, :customer_count
end
