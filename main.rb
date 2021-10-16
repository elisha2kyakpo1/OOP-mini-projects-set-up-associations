require_relative './student'
require_relative './classroom'
require_relative './person'
require_relative './teacher'
require_relative './book'
require_relative './lib/app'
require_relative './lib/operation'

def display_options
  puts "\nPlease choose an option by entering a number:"
  puts '1 - List of all books'
  puts '2 - List of all people'
  puts '3 - Create a person'
  puts '4 - Create a book'
  puts '5 - Create a rental'
  puts '6 - List of all rentals for a given person id'
  puts "7 - Exit\n\n"
end

def p_line_break
  puts "\n"
end

def p_permission
  puts @s_has_permission.to_s
end

def p_list_books
  puts @s_list_books.to_s
end

def p_list_people
  puts @s_list_people.to_s
end

def p_invalid
  puts @s_invalid.to_s
end

def p_create_person_q
  puts @s_create_person_q.to_s
end

def p_person_type
  @g_person_type = gets.strip
end

def p_parent_permission
  @g_parent_permission = gets.strip
end

def p_create_person
  print 'Age: '
  @g_age = gets.strip
  print 'Name: '
  @g_name = gets.strip
end

def p_specialization
  print 'Specialization: '
  @g_specialization = gets.strip
end

def p_created_person_success
  puts @s_created_person_success.to_s
end

def p_created_book_success
  puts @s_created_book_success.to_s
end

def p_rental_success
  puts @s_rental_success.to_s
end

def p_created_rental
  puts @s_created_rental.to_s
end

def p_created_rental_q
  puts @s_created_rental_q.to_s
end

def p_created_rental_q2
  puts @s2_created_rental.to_s
end

def p_created_rental_q3
  puts @s3_p_created_rental.to_s
end

def p_person_index
  @g_person_index = gets.strip.to_i
end

def p_rentals
  puts @s_rentals.to_s
end

def p_rental_person
  puts @s_rental_person.to_s
end

def p_create_book
  print 'Title: '
  @g_title = gets.strip
  print 'Author: '
  @g_author = gets.strip
end

def p_date
  print "\nDate: "
  @g_date = gets.strip.to_s
end

def p_person_id
  print "\nID of person: "
  @g_id = gets.strip.to_i
end

def p_book_index
  @g_book_index = gets.strip.to_i
end

def exit_remarks
  puts 'Thanks for using School Library application'
  sleep(2)
  puts "Exiting application now..\n\n"
  sleep(1)
end

def start(app)
  display_options
  input = gets.chomp
  opp = Operation.new
  opp.operate(input, app)
end

def main
  app = App.new
  start(app)
end

main
