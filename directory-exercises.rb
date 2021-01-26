@students = []

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  name = STDIN.gets.chomp
  if name.empty?
    puts "There are no students"
  end
  while !name.empty? do
    while true do
      puts "What is the student's cohort?"
      cohort_string = gets.chomp
      puts "Is this correct? #{cohort_string}? Put y or n"
      answer = STDIN.gets.chomp
      if answer == 'y'
      break
      end
    end
    @students << {name: name, cohort: cohort_string.to_sym}
      if @students.count == 1
        puts "Now we have 1 student"
      elsif @students.count > 1
        puts "Now we have #{@students.count} students"
      end
      puts "What is the name of the next student?"
      name = gets.delete("\n")
    end
end

def print_header
  puts "The students of Villains Academy".center(50)
  puts "--------------".center(50)
end

def print_students_list
  if @students == nil
    puts "--------------".center(50)
  else
  students_array = []
  puts "Which cohort do you want to print?"
  input = STDIN.gets.chomp
  @students.each do |student_hash|
    student_hash.each do |key, value|
      if key == :cohort && value == input.to_sym
        students_array.push(student_hash[:name])
      end
    end
  end
  puts students_array.join(", ")
  end
end

def print_footer
  if @students == nil
    puts "-----------".center(50)
  else
    if @students.count == 1
      puts "Overall, we have 1 great student".center(50)
    else
      puts "Overall, we have #{@students.count} great students".center(50)
    end
  end
end

def show_students
  print_header
  print_students_list
  print_footer
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit"
end

def process(selection)
  case selection
    when "1"
      input_students
    when "2"
     show_students
    when "3"
      save_students
    when "4"
      load_students
    when "9"
      exit
    else
      puts "I don't know what you meant, try again."
    end
end

def save_students
  # open the file for writing
  file = File.open("students.csv", "w")
  # iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(",")
    @students << {name: name, cohort: cohort.to_sym}
  end
  file.close
end

def try_load_students
  filename = ARGV.first
  return if filename.nil?
  if File.exist?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else
    puts "Sorry, #{filename} doesn't exist."
    exit
  end
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end


try_load_students
interactive_menu
