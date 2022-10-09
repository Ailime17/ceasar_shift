def caesar_cipher(string, shift_factor)
  
    if shift_factor > 32 || shift_factor < 0 || string == ""
      return
    else
      # create a hash with letters as keys and numbers as values
      my_hash = Hash.new(0)
      letter_nr = 0
      ('a'..'z').each do |letter|
        letter_nr += 1
        my_hash[letter] = letter_nr
      end
      
      # transform the string into an array of letters
      string_ar = string.split('')
      
      # transform an array of letters into an array with hashes conisting of 
      # letters from the string as keys and corresponding numbers as values
      transformed_string_ar = string_ar.map do |letter|
        my_hash.select do |key, value|
          letter == key
        end
      end
  
      # create an array with only the corresponding numbers
      numbers_ar = []
      transformed_string_ar.each do |item|
        item.each do |key, value|
          numbers_ar.push(value)
        end
      end

      # increment the numbers by the shift_factor 
       new_numbers_ar = numbers_ar.map do |number|
        number += shift_factor
      end
      final_numbers_ar = new_numbers_ar.map do |n|
        if n > 26
          n = n - 26
        else
          n
        end
      end
      
      # create an array with hashes with the numbers as values and the 
      # corresponding letters as keys  
      transformed_numbers_ar = final_numbers_ar.map do |number|
        my_hash.select do |key,value|
          number == value
        end
      end
  
      # create an array with only the corresponding letters
      final_transformed_letters = []
      transformed_numbers_ar.each do |i|
        i.each do |k,v|
          final_transformed_letters.push(k)
        end
      end
     # transform the array of letters into a string and return it
      return final_transformed_letters.join
    end
  end
  caesar_cipher("hello",5)