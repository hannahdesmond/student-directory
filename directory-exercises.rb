@students = []

def print_menu
  puts "1. Input the students\n2. Show the students\n3. Save the list to students.csv\n4. Load the list from students.csv\n9. Exit"
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
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

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  @name = STDIN.gets.chomp
  while !@name.empty? do
    add_to_list
      if @students.count == 1
        puts "Now we have 1 student"
      elsif @students.count > 1
        puts "Now we have #{@students.count} students"
      end
      puts "What is the name of the next student?"
      @name = STDIN.gets.chomp
   end
end

def print_header
  puts "The students of Villains Academy".center(50)
  puts "--------------".center(50)
end

def print_students_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
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

def add_to_list(name)
  @students << {name: name, cohort: :november}
end

def save_students
  # open the file for writing
  file = File.open("students.csv", "w")
  # iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
    puts "Your list of students has been saved"
    print_students_list
  end
  file.close
end

def load_students
  require 'csv'
  file = CSV.read('students.csv')
    file.each do |student|
      name = student[0]
      add_to_list(name)
    end
    puts "The students have been loaded from students.csv"
    print_students_list
end


interactive_menu
