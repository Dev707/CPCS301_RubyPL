# To print the Main menu for the user
def menu
  puts "|-------------------------------------------------------|
|--------------         Main Menu         --------------|
|-------------------------------------------------------|
|   1. Find the salary for an Employee                  |
|   2. Find the most similar name to the Employee       |
|   3. Print the sum, minimum and maximum of salaries   |
|   4. Add a new employee with his/her salary           |
|   5. Delete an existing employee by his/her name      |
|   6. Quit & Save                                      |
|-------------------------------------------------------|"
  print("> Please enter your choice: ")
end

# This method receive names/data as array
# To find the similar name
def similar_name(input)
  # To ask user to enter the employee name and save it in @name
  print "Enter employee name: "
  name = gets.chomp.downcase
  # current_match for each char match in the word
  current_match=0
  # current_index is the index of name in the array
  current_index=0
  # biggest_match to save the biggest match to compare it later
  biggest_match=0
  # biggest_match to save the index of the biggest match to back to it later
  biggest_match_index=0
  # log is the var where we will record all steps of matching to print it later
  log = ""
  # in this loop we will move to each names in the array for example sub = [Ali, Ahmed, 3000]
  input.each do |sub|
    # To record the steps in the log file
    log+= ("\n====== ")
    log+= "#{current_index}"
    log+= (" ======\n")
    # this loop will take the input from the user which is the name of the employee "ALY"
    # and will convert each char to lowercase A > a | L > l | Y > y
    name.downcase.split("").each do |sub2|
      # this loop will take the first name from the array "Ali"
      # and will convert each char to lowercase
      sub[0].downcase.split("").each do |sub3|
        # To check each letter in the name from array and the name from user if they are equal each other
        if  sub2.eql? sub3
          # if yes then increment current_match by 1 to find the biggest match later
          current_match+=1
          #################################
          # To record the steps in the log file
          log+="from user: #{sub2}\n"
          log+= "from array: #{sub3}\n"
          log+= "#{current_match}\n"
          #################################
          # To move to the next match if found it
          next
        end
      end
    end
    #
    if current_match>biggest_match
      biggest_match = current_match
      biggest_match_index = current_index
    end
    log+= "-------------\n"
    log+= ("Current match is ")
    log+= "#{current_match}\n"
    log+= ("Current index is ")
    log+= "#{current_index}\n"
    log+= ("Biggest match is ")
    log+= "#{biggest_match}\n"
    log+= ("index of the biggest match in the array is ")
    log+= "#{biggest_match_index}\n"
    current_index+=1
    current_match=0
  end
  if input[biggest_match_index][0].length/2 < biggest_match
    puts "Are you looking for  "+input[biggest_match_index][0]+" ?"
    puts "We have in our record:"
    input.each do |sub|
      if  sub[0].downcase.eql? input[biggest_match_index][0].downcase
        puts sub[0] +" "+ (sub[1])[0..-2]
      end
    end

    #print(input[match])
    print "\n"
  else
    puts ">   Sorry, NOT FOUND"
  end
  File.write("log.txt", log)
  #print log
end

def search(input,name)
  x =0
  input.each do |sub|
    temp= sub[0]+" "+(sub[1])[0..-2]
    if temp.downcase.eql? name.downcase
      break
    end
    x+=1
  end
  x
end

def salary(input)
  sum=0
  min=input[0][2].to_i
  max=input[0][2].to_i
  input.each do |sub|
    sum+=sub[2].to_i
    if sub[2].to_i > max
      max = sub[2].to_i
    end
    if min > sub[2].to_i
      min = sub[2].to_i
    end
  end
  print "\nThe Sum is "
  puts sum
  print "The Minimum is "
  puts min
  print "The Maximum is "
  puts max
end
$gvar = 0
# input the data from text file
input = File.readlines("input.CSV").map &:split
while true
  menu
  choice = gets.chomp.to_i
  case choice
  when 1
    print "Enter the employee name for example \"Ali Ahmed\":  "
    name = gets.chomp
    temp = search(input,name)
    if input[temp] != nil
      print "Employee name is "+input[temp][0]+" "+(input[temp][1])[0..-2] +" and his/her salary is "+input[temp][2]+" \n\n"
      #print input[search(input,name)]
    else
      puts ">    NOT FOUND"
    end
  when 2
    start = Time.now
    similar_name(input)
    finish  = Time.now
    puts finish - start
  when 3
    salary(input)
  when 4
    print "Enter the employee's first name: "
    name = gets.chomp
    print "Enter the employee's last name: "
    lastname = gets.chomp
    print "Enter the employee salary: "
    salary = gets.chomp
    input.push([name,lastname+",",salary])
    puts ">    Done!"
  when 5
    print "Enter the employee name for example \"Ali Ahmed\":  "
    name = gets.chomp
    temp = search(input,name)
    if input[temp] != nil
      input.delete_at(temp)
      puts ">    Record deleted successfully! \n\n"
      #print input[search(input,name)]
    else
      puts name+">    NOT FOUND\n\n"
    end

  when 6
    input2 = []
    input.each { |sub|
      input2.push([sub[0]+" "+ (sub[1])[0..-2]," "+sub[2]])
    }
    #print input
    #print input2
    require 'csv'
    CSV.open("Output.csv", "wb",{quote_char: ""} ) do |csv|
      input2.each { |sub| csv << sub }
    end

    puts "\n>    Output file saved successfully!"
    puts ">    Goodbye!"
    break
  else
    puts "I have no idea what to do with that!"
    puts "Let's try again\n"
  end
end
