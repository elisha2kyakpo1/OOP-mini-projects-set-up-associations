require_relative '../rentals'

class App
  attr_accessor :s_has_permission, :s_list_books, :s_list_people, :s_invalid, :g_age, :g_name, :s_create_person_q,
                :g_person_type, :g_parent_permission, :g_specialization, :s_created_person_success, :g_title,
                :g_author, :s_created_book_success, :s_created_rental_q, :s_created_rental, :s2_created_rental,
                :g_book_index, :s3_p_created_rental, :g_person_index, :g_date, :s_rental_success,
                :s_rentals, :s_rental_person

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

    @g_specialization = ''
    @s_created_person_success = "\nPerson created successfully"
    @g_title = ''
    @g_author = ''
    @s_created_book_success = "\nBook created successfully"
    @s_created_rental_q = 'Select a book from the following list by number'
    @s_created_rental = ''
    @s2_created_rental = "\nSelect a person from the following list by number (not id)"
    @g_book_index = ''
    @s3_p_created_rental = ''
    @g_person_index = ''
    @g_date = ''
    @s_rental_success = 'Rental created successfully'
    @s_rentals = 'Rentals:'
    @s_rental_person = ''
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
    p_invalid if @g_person_type != '1' && @g_person_type != '2'

    p_create_person

    person =
      case @g_person_type
      when '1'
        p_permission
        p_parent_permission
        @g_parent_permission = @g_parent_permission.downcase == 'y'

        Student.new(@g_age, @g_name, @g_parent_permission)
      when '2'
        p_specialization
        Teacher.new(@g_age, @g_specialization, @g_name)
      end

    @people << person
    p_created_person_success
  end

  def create_book
    p_create_book
    @books << Book.new(@g_title, @g_author)
    p_created_book_success
  end

  def create_rental
    p_created_rental_q
    @books.each_with_index do |book, index|
      @s_created_rental = "#{index}) Title: \"#{book.title}\", Author: #{book.author}"
      p_created_rental
    end
    p_book_index

    p_created_rental_q2
    @people.each_with_index do |person, index|
      @s3_p_created_rental = "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      p_created_rental_q3
    end

    p_person_index
    p_date

    @rentals << Rental.new(@g_date, @books[@g_book_index], @people[@g_person_index])
    p_rental_success
  end

  def list_rentals_for_person_id
    p_person_id
    rentals = @rentals.filter { |rental| rental.person.id == @g_id }
    p_rentals
    rentals.each do |rental|
      @s_rental_person = "Date: #{rental.date}, Book \"#{rental.book.title}\" by #{rental.book.author}"
      p_rental_person
    end
  end
end
