Fabricator(:assignment) do
  timeslot {Fabricate(:timeslot)}
  boat {Fabricate(:boat) }
end
