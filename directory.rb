puts ""

@students = []

def interative_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def print_menu
  puts "What would you like to do (choose number)?"
  puts "1. Input the students."
  puts "2. Show the students."
  puts "3. Save the list to chosen 'csv' file"
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
    feedback
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
  @name = STDIN.gets.chomp
  puts "Cohort: "
  @cohort = STDIN.gets.chomp
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
      puts "#{index}.#{student[:name]} (#{student[:cohort]} cohort)".center(180)
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

def feedback
  puts "Request completed."
end

def save_students
  puts "Enter chosen filename (no type required)."
  filename = gets.chomp
  file = File.open("#{filename}.csv", "w")
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
  feedback
end

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(",")
    @students << {name: name, cohort: cohort.to_sym}
  end
  file.close
  puts "Loaded #{@students.count} from #{filename}"
end

def try_load_students
  filename = ARGV.first || "students.csv" if filename.nil?
  if File.exists?(filename)
    load_students(filename)
  else
    puts "Sorry #{filename} doesn't exist."
    exit
  end
end

try_load_students
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
