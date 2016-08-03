puts ""

def input_students
  puts "Please enter the names & hobbies of the students."
  puts "To finish, just hit return thrice."

  students = []

  puts "Name: "
  name = gets.chomp
  puts "Hobby: "
  hobby = gets.chomp
  puts "Cohort: "
  cohort = gets.chomp.to_sym
  if cohort == ""
    cohort = :november
  end

  while !name.empty? do
    students << {name: name, cohort: cohort, hobby: hobby}
    if students.length == 1
      puts "Now we have #{students.count} student."
    else
      puts "Now we have #{students.count} students."
    end

    puts "Name: "
    name = gets.chomp
    puts "Hobby: "
    hobby = gets.chomp
    puts "Cohort: "
    cohort = gets.chomp
    if cohort == ""
      cohort = :november
    end
  end

  students
end

def print_header
  puts ("The students of villains academy").center(180)
  puts ("---------------------------").center(180)
end

def print(students)
  marker = students.length
  index = 0
  until index == marker
      output = "#{index + 1}.#{students[index][:name]} (enjoys #{students[index][:hobby]}) (#{students[index][:cohort]} cohort)"
      puts output.center(180)
      index += 1
  end
end

def print_footer(students)
  puts ("---------------------------").center(180)
  if students.count == 0
    puts ("We currently have no students").center(180)
  elsif students.count == 1
    puts ("Overall we have #{students.count} great student.").center(180)
  else
    puts ("Overall we have #{students.count} great students.").center(180)
  end
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
