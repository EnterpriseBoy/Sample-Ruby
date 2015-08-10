input_char = ''
esc_char= 'esc'
array_counter = 1
first_array=[]
second_array=[]
third_arry=[]


while input_char.chomp != esc_char.to_s  do
	puts "Please Enter a number between 0 and 9 for the first array, type esc to esc"
	input_char = gets
	input_char = input_char.chomp
	if ['0','1','2','3','4','5','6','7','8','9'].include? input_char
		first_array = first_array << input_char
	elsif ['esc'].include? input_char
	else
		puts "Illegal character entered, please just enter between 0 and 9"
		puts ""
	end
end
system 'clear'

#Resetting the escape character of the loop
input_char = ''

#While loop for accepting the inputs from the second loop
while input_char.chomp != esc_char.to_s  do
   puts "Please Enter a number between 0 and 9 for the second array, type esc to esc"
   input_char = gets
      input_char = input_char.chomp
   if ['0','1','2','3','4','5','6','7','8','9'].include? input_char
   	second_array = second_array << input_char.chomp
   elsif ['esc'].include? input_char
   else
		puts "Illegal character entered, please just enter between 0 and 9"
		puts ""
	end
end

input_char = ''
#While loop for accepting the inputs from the second loop
while input_char.chomp != esc_char.to_s  do
   puts "Please Enter a number between 0 and 9 for the Third array, type esc to esc"
   input_char = gets
      input_char = input_char.chomp
   if ['0','1','2','3','4','5','6','7','8','9'].include? input_char
   	third_arry = third_arry << input_char.chomp
   elsif ['esc'].include? input_char
   else
		puts "Illegal character entered, please just enter between 0 and 9"
		puts ""
	end
end
#Clearing screen to display the restults. 
system 'clear'
puts "First Array           =    #{first_array.to_s}"
puts "Second Array          =    #{second_array.to_s}"
puts "Third Array           =    #{second_array.to_s}"
first_array = first_array << second_array
first_array = first_array << third_arry
puts "Final array           =    #{first_array.to_s}"
first_array = first_array.flatten
puts "Final array flattened =    #{first_array.to_s}"
