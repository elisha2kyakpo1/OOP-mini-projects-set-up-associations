require_relative './student'
require_relative './classroom'
require_relative './person'
require_relative './rentals'
require_relative './teacher'
require_relative './book'
require_relative './lib/app'

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

def exit_remarks
  puts 'Thanks for School Library application'
  sleep(2)
  puts "Exiting application now..\n\n"
  sleep(1)
end

def start(app)
  display_options
  input = gets.chomp
  operate(input, app)
end

def operate(input, app)
  case input
  when '1'
    puts "\n"
    app.list_books
  when '2'
    puts "\n"
    app.list_people
  when '3'
    puts "\n"
    app.create_person
  when '4'
    puts "\n"
    app.create_book
  when '5'
    puts "\n"
    app.create_rental
  when '6'
    puts "\n"
    app.list_rentals_for_person_id
  when '7'
    exit_remarks
    exit
  else
    puts "\nWrong input! Please Select the Available Option\n"
  end
  start(app)
end

def main
  app = App.new
  start(app)
end

main
