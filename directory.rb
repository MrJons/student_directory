puts ""

def input_students
  puts "Please enter the names & hobbies of the students."
  puts "To finish, just hit return thrice."

  students = []

  puts "Name: "
  name = gets.chomp!
  puts "Hobby: "
  hobby = gets.chomp!

  while !name.empty? do
    students << {name: name, cohort: :november, hobby: hobby}
    puts "Now we have #{students.count} students."

    puts "Name: "
    name = gets.chomp
    puts "Hobby: "
    hobby = gets.chomp
  end

  students
end

def print_header
  puts "The students of villains academy"
  puts "---------"
end

def print(students)
  marker = students.length
  index = 0
  until index == marker
      puts "#{index + 1}.#{students[index][:name]} (enjoys #{students[index][:hobby]}) (#{students[index][:cohort]} cohort)"
      index += 1
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

def names_shorther_then_12(students)
  puts "Only names shorther than twelve characters will be printed."
  students.each.with_index(1) do |student, index|
    if student[:name].length < 12
      puts "#{index}.#{student[:name]} (#{student[:cohort]} cohort)"
    end
  end
end

students = input_students
print_header
print(students)
print_footer(students)

puts ""
