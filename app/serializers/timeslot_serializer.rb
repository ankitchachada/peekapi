class TimeslotSerializer < ActiveModel::Serializer
  attributes :id,:start_time, :duration, :availability, :customer_count

  attribute :boats,  if: :is_date?
  def boats
  	object.boats.pluck(:id)
  end

  def is_date?
  	true if @instance_options[:date]
  end
end
