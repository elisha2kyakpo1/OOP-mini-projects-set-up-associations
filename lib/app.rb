require_relative '../rentals'

class App
  attr_accessor :s_has_permission, :s_list_books, :s_list_people, :s_invalid, :g_age, :g_name, :s_create_person_q, :g_person_type, :g_parent_permission
  def initialize
    @books = []
    @people = []
    @rentals = []
    @s_has_permission = 'Has parent permission? [Y/N]: '
    @s_list_books = ''
    @s_list_people = ''
    @s_invalid = 'Invalid option'
    @g_age = ''
    @g_name = ''
    @s_create_person_q = 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    @g_person_type = ''
    @g_parent_permission = ''
  end

  def list_books
    @books.each do |book|
      @s_list_books = "Title: \"#{book.title}\", Author: #{book.author}"
      p_list_books
    end
  end

  def list_people
    @people.each do |person|
      @s_list_people = "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      p_list_people
    end
  end

  def create_person
    p_create_person_q
    p_person_type
    if @g_person_type != '1' && @g_person_type != '2'
      p_invalid
    end

    p_create_person

    person =
      case @g_person_type
      when '1'
        p_permission
        p_parent_permission
        @g_parent_permission = @g_parent_permission.downcase == 'y'

        Student.new(@g_age, @g_name, @g_parent_permission)
      when '2'
        print 'Specialization: '
        specialization = gets.chomp

        Teacher.new(@g_age, specialization, @g_name)
      end

    @people << person
    puts "\nPerson created successfully"
  end

  def create_book
    print 'Title: '
    title = gets.chomp

    print 'Author: '
    author = gets.chomp

    @books << Book.new(title, author)
    puts "\nBook created successfully"
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
