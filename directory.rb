student_count = 11
students = ["Dr. Hannibal Lecter",
"Darth Vader",
"Nurse Ratched",
"Micahel Corleone",
"Alex DeLarge",
"The Wicked Witch of the West",
"Terminator",
"Freddie Krueger",
"The Joker",
"Joffrey Baratheon",
"Norman Bates"]
puts "The students of Villains Academy"
puts "--------------"
students.each do |student|
  puts student
end
puts "Overall, we have #{students.count} great students"
