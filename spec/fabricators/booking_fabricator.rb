Fabricator(:booking) do
  timeslot {Fabricate(:timeslot)}
  size     6
end

