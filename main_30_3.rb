require_relative 'lib/clothes.rb'

file_list = Dir[__dir__ + "/data/*.txt"]

items = []
file_list.each do |file|
	item = File.readlines(file, chomp: true)
	items << Clothes.new(item[0], item[1], item[2].delete("()").split(",").map(&:to_i))
end

puts "Сколько градусов за окном? (можно с минусом)"
temp_input = STDIN.gets.to_i

matching_clothes = []

items.each do |item|
	matching_clothes << item if item.check_temp(temp_input) == 1
end

hash = {}

matching_clothes.each do |item|
	hash[item.get_type] = []
end

matching_clothes.each do |item|
	hash[item.get_type] << item
end

puts
puts "Ваш прикид на сегодня:"
puts "*"*50

hash.each do |key, value|
	puts value.sample.to_s
end

puts "*"*50
