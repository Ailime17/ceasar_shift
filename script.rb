def caesar_cipher(string, key)
  alphabet = %w(a b c d e f g h i j k l m n o p q r s t u v w x y z)
  shifted_string_arr = []

  # shift the letters by the 'key' amount of places
  string_arr = string.split("")
  string_arr.each do |char|
    unless alphabet.include?(char.downcase)
      shifted_string_arr.push(char)
      next
    end

    index = alphabet.index(char.downcase)
    if key.positive?
      key.times do
        if index == 25
          index = 0
        else
          index += 1
        end
      end
    else
      key.abs.times do
        if index == 0
          index = 25
        else
          index -= 1
        end
      end
    end
    shifted_char = alphabet[index]
    shifted_string_arr.push(shifted_char)
  end

  shifted_string = shifted_string_arr.join

  # switch letters that need to be uppercase to uppercase
  0.upto(string.length-1) do |n|
    next unless alphabet.include?(string[n].downcase)

    if string[n] == string[n].upcase
      shifted_string[n] = shifted_string[n].upcase
    end
  end

  p shifted_string
  return shifted_string
end
caesar_cipher('Hello! How r u? xo', 5)
