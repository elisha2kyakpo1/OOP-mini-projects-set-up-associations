class Operation
  attr_accessor :wrong_input

  def initialize
    @wrong_input = "\nWrong input! Please Select the Available Option\n"
  end

  def operate(input, app)
    case input
    when '1'
      p_line_break
      app.list_books
    when '2'
      p_line_break
      app.list_people
    when '3'
      p_line_break
      app.create_person
    when '4'
      p_line_break
      app.create_book
    when '5'
      p_line_break
      app.create_rental
    when '6'
      p_line_break
      app.list_rentals_for_person_id
    when '7'
      exit_remarks
      exit
    else
      p_wrong_input
    end
    start(app)
  end
end
