require_relative 'lib/clothes'

file_list = Dir[__dir__ + "/data/*.txt"]

items = []
file_list.each do |file|
	item = File.readlines(file, chomp: true)
  items << Clothes.new(item[0], item[1], item[2].delete("()").split(",").map(&:to_i))
end

puts "Сколько градусов за окном? (можно с минусом)"
temp_input = STDIN.gets.to_i

matching_clothes = []
matching_clothes << items.select { |item| item.check_temp(temp_input) }

puts
puts "Ваш прикид на сегодня:"
puts "*"*50

matching_clothes[0].group_by { |item| item.type }.each do |item|
  puts item[1].sample
end

puts "*"*50
