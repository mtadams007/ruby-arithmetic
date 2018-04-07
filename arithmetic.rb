#a must be a integer to work
def multiply(a,b)
  output = 0
  while b > 0
    output+=a
    b-=1
  end
  output
end

# puts multiply(4,10)
# puts multiply(3,2.5)

#numbers don't have to be integers
def divide(a,b,num_of_sig_figs=10)
  #output will be our answer
  output = 0
  #we loop until our dividend is smaller than our divisor
  while a >= b
    # we subtract the divisor from the dividend and the difference is our new dividend
    a -= b
    #we increase the output by 1
    output += 1
  end
  if a == 0
    #if there is no remainder we return the output
    output
  else
    #if there is a remainder we need to change the output to a string
    output = output.to_s
    #sig_figs keeps track of the significant figures we've made
    sig_figs = output.length
    #remainder_args takes an array of three arguments - the dividend, divisor and the final answer string which ends with a . as we will be adding decimals
    remainder_args = [a,b,output + '.']
    #the default number of significant figures is 10. The loop runs until we hit the number of significant figures or if there is no remainder left
    while sig_figs < num_of_sig_figs && remainder_args[0] != 0
      #we have to create a new function which we will call recursively to add any new digits after the decimal point. We must call it on an array because otherwise we cannot change the variables due to Ruby's scope
      def remainder_divide(arr)
        #we multiply the dividend by 10 to make it a non decimal number
        arr[0] = multiply(arr[0], 10)
        #this loop is the same as our original division
        output = 0
        while arr[0] >= arr[1]
          arr[0] -= arr[1]
          output += 1
        end
        #here we change the output to a string and attach it to our original answer.
        output = output.to_s
        arr[2] += output
        #We change the remainder_args to our new array
        remainder_args = [arr[0],arr[1],arr[2]]
      end
      #now that we've defined our function, we will call it on our array of arguments until we hit the desired amount of significant figures or we have the answer
      remainder_divide(remainder_args)
      #we add one to our significant figures so that we don't loop infinitely
      sig_figs += 1
    end
    #we return our answer converted back to a number
    remainder_args[2].to_f
  end
end
puts divide(11,2,10)
puts divide(58.234,13.4,10)
