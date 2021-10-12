require './rentals'
# book class
class Book

  attr_accessor :title, :author

  def initialize(title, author)
    @title = title
    @author = author
  end

  has_many :rentals
end
