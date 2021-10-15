require_relative './student'
require_relative './classroom'
require_relative './person'
require_relative './rentals'
require_relative './teacher'
require_relative './book'

class App
  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def list_books
    @books.each do |book|
      puts "Title: \"#{book.title}\", Author: #{book.author}"
    end
  end

  def list_people
    @people.each do |person|
      puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
  end

  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    person_type = gets.chomp
    if person_type != '1' && person_type != '2'
      puts 'Invalid option'
      return
    end

    print 'Age: '
    age = gets.chomp

    print 'Name: '
    name = gets.chomp

    person =
      case person_type
      when '1'
        print 'Has parent permission? [Y/N]: '
        parent_permission = gets.chomp
        parent_permission = parent_permission.downcase == 'y'

        Student.new(age, name, parent_permission)
      when '2'
        print 'Specialization: '
        specialization = gets.chomp

        Teacher.new(age, specialization, name)
      end

    @people << person
    puts 'Person created successfully'
  end

  def create_book
    print 'Title: '
    title = gets.chomp

    print 'Author: '
    author = gets.chomp

    @books << Book.new(title, author)
    puts 'Book created successfully'
  end

  def create_rental
    puts 'Select a book from the following list by number'
    @books.each_with_index do |book, index|
      puts "#{index}) Title: \"#{book.title}\", Author: #{book.author}"
    end
    book_index = gets.chomp.to_i

    puts "\nSelect a person from the following list by number (not id)"
    @people.each_with_index do |person, index|
      puts "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end

    person_index = gets.chomp.to_i

    print "\nDate: "
    date = gets.chomp

    @rentals << Rental.new(date, @books[book_index], @people[person_index])
    puts 'Rental created successfully'
  end

  def list_rentals_for_person_id
    print 'ID of person: '
    id = gets.chomp.to_i

    rentals = @rentals.filter { |rental| rental.person.id == id }
    puts 'Rentals:'
    rentals.each do |rental|
      puts "Date: #{rental.date}, Book \"#{rental.book.title}\" by #{rental.book.author}"
    end
  end
end

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
