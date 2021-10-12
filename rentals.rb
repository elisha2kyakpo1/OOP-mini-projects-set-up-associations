require './book'
require './person'

# rentals class
class Rental
  attr_accessor :date

  def initialize(date)
    @date = date
    @person = Person.new
    @book = Book.new
  end

  belongs_to :book
  belongs_to :person
end
