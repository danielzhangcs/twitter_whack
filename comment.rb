def comment(index)
    if index == 0
        'You got whacked!'
      elsif index <= 5
        'Excellent!'
        elsif index <= 10
        "That's pretty good!"
      elsif index <= 50
        'Not Bad!'
      elsif index <= 90
        'Try some new words'
      else
        'Try again!'
      end
    end