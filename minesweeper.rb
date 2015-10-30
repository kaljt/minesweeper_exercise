class Board
LENGTH_IDENTIFIER = "-"
VALID_BOARD_CHARACTERS = ["+", "-", "|", "*", " "]



def Board.transform(input)
  height = input.size - 2
  length = input[0].count(LENGTH_IDENTIFIER)
  square_count = length * height
  valid_board(input)
  all_squares_have_mines?(square_count,input)
end

  def Board.all_squares_have_mines?(sq_count, input)
    if input.join.chars.count("*") == sq_count
      input
    end
  end

  def Board.valid_board(input)
    Exception.new(ValueError)
    border_test = ["+","+"]
    top_bottom = ""
    string_size = input.first.size
    input.each do |square_row|
      if square_row.size != string_size
      raise(ValueError,"The rows are not equal length!")
      end
    end
    input.join.chars.each do |character|
      if !VALID_BOARD_CHARACTERS.include?(character)
      raise(ValueError,"Board contains invalid character combination")
      end
    end

    (string_size - 2).times {top_bottom << "-"}
    border_test = border_test.insert(1,top_bottom).join
    if border_test != input.first || border_test != input.last
      raise(ValueError, "missing or mispositioned characters in square row")
    end
  end


end

class ValueError < Exception
end