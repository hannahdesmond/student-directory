def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  students = []
  name = gets.chomp
  while !name.empty? do
    while true do
      puts "What is the student's cohort?"
      cohort_string = gets.chomp
      puts "Is this correct? #{cohort_string}. Put y or n"
      answer = gets.chomp
      if answer == 'y'
      puts "What is the student's hobby?"
      hobby = gets.chomp
      puts "What is the student's country?"
      country = gets.chomp
      break
      end
    end
    students << {name: name, cohort: cohort_string.to_sym,
      hobby: hobby, country: country}
    puts "Now we have #{students.count} students"
    name = gets.chomp
  end
  students
end

def print_header
  puts "The students of Villains Academy".center(50)
  puts "--------------".center(50)
end
def print(students)
  counter = 0
  while true do
    hash = students[counter]
    puts "#{counter + 1}. #{hash[:name]} "
    puts "Hobbies: #{hash[:hobby]}, country: #{hash[:country]} "
    puts "(Cohort #{hash[:cohort]})"
    counter +=1
    if counter == students.count
      break
    end
  end
end
def print_footer(students)
  puts "Overall, we have #{students.count} great students".center(50)
end
students = input_students
print_header
print(students)
print_footer(students)
