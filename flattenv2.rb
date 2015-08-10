input_value = ''
escape_character_array_creation= 'esc'
escape_character_loop_program='esc'
collection_of_arrays = Array.new
final_array = Array.new
count = 0

#A do while loop as the user should enter one set of values
begin
	#Creating a new array
	individual_array = Array.new
	#While loop to check the input from the user and exit when 'esc' typed
	while input_value.chomp != escape_character_array_creation.to_s  do
		puts "Please Enter a number to be stored in the array, type 'esc' to quit"
		#Checking user has only inputted an integer
		begin
			input_value = gets
			user_num=Integer(input_value)
			individual_array << user_num
		rescue  
			puts "This is not an integer. Please enter an integer eg 333 or 'esc' to quit "
		end
	end
	
	puts "If you would like to exit from the whole program type 'esc' to quit "
	#Storing the Array in the collection. 
	collection_of_arrays[count] = individual_array
	#Incremeting the collection of Arrays
	count = count +1
	#Reset the input from the keyboard
	input_value = ''
	input_value = gets
	input_value = input_value.chomp

end while input_value != escape_character_loop_program.to_s

puts 'This the final array unflattened' + collection_of_arrays.to_s

count = 0
collection_of_arrays.each do |counter|
	puts 'Array value for Array ' + count.to_s + " "+ collection_of_arrays[count].to_s
	collection_of_arrays[count].each do |element_counter|
		final_array << element_counter
	end
	count += 1
end
puts 'This is the final array flattened' + final_array.to_s
	
