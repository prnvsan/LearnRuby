
$numbers=[]
def callfunc(var)
  i=0 
  while i < 6
    puts "At the top i is #{i}"
   $numbers.push(i)

    i += var
    puts "Numbers now: ",$numbers
    puts "At the bottom i is #{i}"
  end
end
callfunc(2)
puts "The numbers: "
numbers.each {|num| puts num }
