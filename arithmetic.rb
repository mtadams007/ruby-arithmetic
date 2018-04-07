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

def divide(a,b)
  output = 0
  while a >= b
    a -= b
    output += 1
  end
  if a == 0
    output
  else
    output = output.to_s
    sig_figs = 0
    remainder_args = [a,b,output + '.']
    while sig_figs < 5 && a != 0
      def remainder_divide(arr)
        arr[0] = multiply(arr[0], 10)
        output = 0
        while arr[0] >= arr[1]
          arr[0] -= arr[1]
          output += 1
        end
        output = output.to_s
        arr[2] += output
        arr[0]
        remainder_args = [arr[0],arr[1],arr[2]]
      end
      remainder_divide(remainder_args)
      sig_figs += 1
    end
    remainder_args[2].to_f
  end
end
# puts divide(10,2)
puts divide(28,3)
puts divide(58.234,13.4)
