def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  students = []
  name = gets.delete("\n")
  while !name.empty? do
    while true do
      puts "What is the student's cohort?"
      cohort_string = gets.chomp
      puts "Is this correct? #{cohort_string}? Put y or n"
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
    puts "What is the name of the next student?"
    name = gets.delete("\n")
  end
  if students.count != 0
    return students
  else
    puts "There are no students"
  end
end

def print_header
  puts "The students of Villains Academy".center(50)
  puts "--------------".center(50)
end

def print(students)
  if students == nil
    puts "--------------".center(50)
  else
  students_array = []
  puts "Which cohort do you want to print?"
  input = gets.delete("\n")
  students.each do |student_hash|
    student_hash.each do |key, value|
      if key == :cohort && value == input.to_sym
        students_array.push(student_hash[:name])
      end
    end
  end
  puts students_array.join(", ")
  end
end

def print_footer(students)
  if students == nil
    puts "-----------".center(50)
  else
    if students.count == 1
      puts "Overall, we have 1 great student".center(50)
    else
      puts "Overall, we have #{students.count} great students".center(50)
    end
  end
end

# students = input_students
# print_header
# print(students)
# print_footer(students)

def interactive_menu
  students = []
  loop do
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit"

    selection = gets.chomp

    case selection
      when "1"
      # input the students
      when "2"
      # show the students
      when "9"
        exit
      else
        puts "I don't know what you meant, try again."
      end
  # 3. Do what the user has asked
  end
end

puts interactive_menu
