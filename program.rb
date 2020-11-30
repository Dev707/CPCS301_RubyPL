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
  # To calculate the run time
  start = Time.now
  # current_match for each char match in the word
  current_match=0
  # current_index is the index of name in the array
  current_index=0
  # biggest_match to save the biggest match to compare it later
  biggest_match=0
  # biggest_match to save the index of the biggest match to back to it later
  biggest_match_index=-1
  # log is the var where we will record all steps of matching to print it later
  log = ""
  # in this loop we will move to each names in the array for example sub = [Ali, Ahmed, 3000]
  input.each do |sub|
    # To check if we can find the name directly then no need to do all process
    if name.downcase.eql? sub[0].downcase
      log+= "\nStop at index: #{current_index} found full matching\n"
      biggest_match = name.length
      biggest_match_index = current_index
      break
    else
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
    end
    # if the current_match greater than the biggest match
    # that mean this is the similar name
    if current_match>biggest_match
      # if the current match grater then the length of the word
      # that mean this is the similar name to the input
		chance = (current_match.to_f/input[current_index][0].length.to_f >= biggest_match.to_f/input[biggest_match_index][0].length.to_f)
		if (chance && current_match.to_f/input[current_index][0].length.to_f > 0.5) && ((input[current_index][0].length.to_f/2) < current_match)
			# if the current match grater then the half of the length of the word
			#if (input[current_index][0].length.to_f/2) < current_match
				# Save the current index and the biggest match to back to it later
				biggest_match = current_match
				biggest_match_index = current_index
			#end
		end
    end
    #####################################
    # To record the steps in the log file
    log+= "----------------------\n"
    log+= ("Current match is ")
    log+= "#{current_match}\n"
    log+= ("Current index is ")
    log+= "#{current_index}\n"
    log+= ("Biggest match is ")
    log+= "#{biggest_match}\n"
    log+= ("index of the biggest match in the array is ")
    log+= "#{biggest_match_index}\n"
    log+= "#{input[current_index][0]} | #{((current_match.to_f/input[current_index][0].length.to_f)*100).round(2)} % \n"
    log+= "----------------------\n"
    #####################################
    # To move to the next name
    current_index+=1
    # To clear the counter
    current_match=0
  end
  # if the biggest match index still -1 that mean we didn't find the name
  if biggest_match_index != -1
    #################################
    # To print the result to the user
    puts "Are you looking for  "+input[biggest_match_index][0]+" ?"
    puts "We have in our record:"
    #################################
    input.each do |sub|
      # To check if there is another one have the same name
      if  sub[0].downcase.eql? input[biggest_match_index][0].downcase
        # To print the result to the user
        puts sub[0] +" "+ (sub[1])[0..-2]
      end
    end
    # print new line
    print "\n"
  else
    # if there's no match in our records
    puts ">   Sorry, NOT FOUND"
  end
  # To calculate the run time
  finish = Time.now
  total = finish - start
  log+="\n\n-------------------------------------"
  log+="\nStart at: #{start}"
  log+="\nEnd at: #{finish}"
  log+="\nTotal run time is: #{total} sec"
  log+="\n-------------------------------------\n"
  # To write all the steps in log file
  File.write("log.txt", log)
  #print log
end

# This method receive name and data as array
# To find the name in data and return index
def search(input,name)
  # index
  x =0
  input.each do |sub|
    # To add the first and the last name together
    temp= sub[0]+" "+(sub[1])[0..-2]
    # To check if they are equal each other
    if temp.downcase.eql? name.downcase
      # if yes then stop looking more
      break
    end
    # to go to the next index
    x+=1
  end
  # return index of the match
  x
end

def salary(input)
  # To calculate the sum
  sum=0
  # To find the min
  min=input[0][2].to_i
  # To find the max
  max=input[0][2].to_i
  input.each do |sub|
    # To sum all salary
    sum+=sub[2].to_i
    # if the salary grater then max that mean this is the maximum salary
    if sub[2].to_i > max
      max = sub[2].to_i
    end
    # if the salary less then min that mean this is the minimum salary
    if min > sub[2].to_i
      min = sub[2].to_i
    end
  end
  #################################
  # To print the result to the user
  print "\nThe Sum is "
  puts sum
  print "The Minimum is "
  puts min
  print "The Maximum is "
  puts max
  #################################
end
# input the data from csv file and split it to array
input = File.readlines("input.CSV").map &:split
# it will show the Main menu till the user ask to exit and save
while true
  # To show the Main menu
  menu
  # get the user choice from the Main menu
  choice = gets.chomp.to_i
  # To display what the user choice from the Main menu
  case choice

    # 1 to show the main menu
  when 1
    # To print the question
    print "Enter the employee name for example \"Ali Ahmed\":  "
    name = gets.chomp
    temp = search(input,name)
    if input[temp] != nil
      # To print the result to the user
      print "Employee name is "+input[temp][0]+" "+(input[temp][1])[0..-2] +" and his/her salary is "+input[temp][2]+" \n\n"
      #print input[search(input,name)]
    else
      # if there's no match in our records
      puts ">    Sorry, NOT FOUND"
    end

    # 2 to find the Similar name
  when 2
    similar_name(input)

    # 3 to calculate the salary sum, max, min
  when 3
    salary(input)

    # 4 to add new employee to the array
  when 4
    # To print the question
    print "Enter the employee name: "
    # To receive the name and split the name to first and last
    name = gets.chomp.split
    # show error message if user entered wrong input
    if name[1] == nil
      puts "\n>    Error, make sure to enter valid name for example \"Ahmed Ali\"\n\n"
      next
    end
    # To print the question
    print "Enter the employee salary: "
    salary = gets.chomp
    # To push the new element to the array
    input.push([name[0],name[1]+",",salary])
    # To print result
    puts ">    Record added successfully! \n\n"

    # 5 to delete an exited employee from the array
     when 5
    # To print the question
    print "Enter the employee name for example \"Ali Ahmed\":  "
    name = gets.chomp
    # To get the index of the employee from the array
    temp = search(input,name)
    # if temp is not nil that mean we have this name in our record
    if input[temp] != nil
      # delete the name by using index from search method
      input.delete_at(temp)
      # To print result
      puts ">    Record deleted successfully! \n\n"
      #print input[search(input,name)]
    else
      # if there's no match in our records
      ">    Sorry, #{name} NOT FOUND\n\n"
    end

    # 6 to save the new collection in output file and exit from the program
  when 6
    # creat new array to copy the data to it with new format
    input2 = []
    # mix the first and the last name together for each element
    input.each { |sub|
      input2.push([sub[0]+" "+ (sub[1])[0..-2]," "+sub[2]])
    }
    #print input
    #print input2
    # To write into csv file
    require 'csv'
    # creat new csv file output.csv and remove any "" marks
    CSV.open("Output.csv", "wb",{quote_char: ""} ) do |csv|
      # writing into the file
      input2.each { |sub| csv << sub }
    end
    # To print the result
    puts "\n>    Output file saved successfully!"
    puts ">    Goodbye!"
    break
  else
    # if the user entered wrong input
    puts "I have no idea what to do with that!"
    puts "Let's try again\n"
  end
end
##########################################################################