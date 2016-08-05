puts ""

def interative_menu
  @students = []
  loop do
    print_menu
    process(gets.chomp)
  end
end

def print_menu
  puts "What would you like to do (choose number)?"
  puts "1. Input the students."
  puts "2. Show the students."
  puts "3. Save the list to 'students.csv'"
  puts "4. Load student list from students.csv"
  puts "9. Exit."
end

def process(choice)
  case choice
  when "1"
    input_students(@user_input)
  when "2"
    show_students
  when "3"
    save_students
  when "4"
    load_students
  when "9"
    exit
  else
    puts "I'm not sure what you mean, please choose a number."
  end
end

def input_students input_proc
  puts "Please enter the names & hobbies of the students."
  puts "To finish, just hit return twice."

  input_proc.call

  while !@name.empty? do
    @students << {name: @name, cohort: @cohort}
    if @students.length == 1
      puts "Now we have #{@students.count} student."
    else
      puts "Now we have #{@students.count} students."
    end
    input_proc.call
  end
end

@user_input = Proc.new do
  puts "Name: "
  @name = gets.chomp
  puts "Cohort: "
  @cohort = gets.chomp
  @cohort = :november if @cohort.empty?
end

def show_students
  print_header
  print_students_list
  print_footer
end

def print_header
  if @students.count > 0
    puts ("The students of villains academy").center(180)
    puts ("---------------------------").center(180)
  end
end

def print_students_list
  if @students.count > 0
    @students.each.with_index(1) do |student, index|
      output = "#{index}.#{student[:name]} (#{student[:cohort]} cohort)"
      puts output.center(180)
    end
  end
end

def print_footer
  puts ("---------------------------").center(180)
  if @students.count == 0
    puts ("We currently have no students").center(180)
  elsif @students.count == 1
    puts ("Overall we have #{@students.count} great student.").center(180)
  else
    puts ("Overall we have #{@students.count} great students.").center(180)
  end
end

def save_students
  file = File.open("students.csv", "w")
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def load_students
  file = File.open("students.csv", "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(",")
    @students << {name: name, cohort: cohort.to_sym}
  end
  file.close
end

interative_menu
puts ""


=begin
def name_starter
  puts "Enter the letter you want to view student names by."
  letter = gets.chomp
  @students.each.with_index(1) do |student, index|
    if student[:name][0] == letter
      puts "#{index}.#{student[:name]} (#{student[:cohort]} cohort)"
    end
  end
end

def names_shorther_then_12
  puts "Only names shorther than twelve characters will be printed."
  @students.each.with_index(1) do |student, index|
    if student[:name].length < 12
      puts "#{index}.#{student[:name]} (#{student[:cohort]} cohort)"
    end
  end
end
=end
