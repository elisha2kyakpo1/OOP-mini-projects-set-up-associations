require './book'
require './person'

# rentals class
class Rental
  attr_accessor :date, :book, :person

  def initialize(date, book, person)
    @date = date
    @book = book
    @person = person

    @book = book
    book.rentals << self
  
    @person = person
    person.rentals << self
  end
end