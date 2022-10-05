lists = ["Todo", "In progress", "Review", "Done", "Cancelled"]
lists.each do |list_name|
  List.create!(name: list_name)
end
