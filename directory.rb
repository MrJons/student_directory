puts ""

def input_students
  puts "Please enter the names of the students."
  puts "To finish, just hit return twice."

  students = []
  name = gets.chomp

  while !name.empty? do
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students."
    name = gets.chomp
  end

  students
end

def print_header
  puts "The students of villains academy"
  puts "---------"
end

def print(students)
  students.each.with_index(1) do |student, index|
    puts "#{index}.#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer(students)
  puts "Overall we have #{students.count} great students."
end

def name_starter(students)
  puts "Enter the letter you want to view student names by."
  letter = gets.chomp
  students.each.with_index(1) do |student, index|
    if student[:name][0] == letter
      puts "#{index}.#{student[:name]} (#{student[:cohort]} cohort)"
    end
  end
end


students = input_students
print_header
name_starter(students)
print_footer(students)

puts ""
