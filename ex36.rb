

def goblin
  puts "You have chosen the easy way out"
  puts "You have approached a fork in the path. You can hear loud thuds. Do you go left or right?"
 print ">"
  choice = $stdin.gets.chomp

  if choice == "left"
    puts "There is another fork in the path, you hear screams from the distance choose quick,  left or right?  "
    print ">"
    choice2 = $stdin.gets.chomp

      if choice2 == "right"
        puts " Congratulations you wimp, you made it out somehow!"
      

     elsif choice2 == "left"
        puts " Oh no you've run into a wailing banshee, she puts you to eternal sleep"
      

     else
       puts "You choose wrong, you fell into a bottomless pit and died  :o "
     end

  elsif choice == "right"
   
    puts " You've run into a gigantic orc, he pulls out a club and bludgeons you to death. Too bad! "
  
  else 
    puts " You didn't choose left or right and you waited. The Dragon woke up and burnt you to cinders!"
  end
end



def dragon
  puts "The dragon stirs. You have a flute"
  puts "Do you play it or try moving forward?" 
  print ">"
  choice = $stdin.gets.chomp
  
  if choice == "play it"
    puts "TUUUTUUUU"   
    puts "The dragon comfily tucks into his bed of gold"
    puts "You move close enough to get some gold"
    puts "You can onlu carry one chest. Do you carry the big one or the smol one?  
    print ">"
    var1 = $stdin.get.chomp
    if var1 == big
      puts "So you've chosen the big one, well anyways time for your escape.

  if choice == "move forward"
    puts " Are you sure about that?"
    puts "Y/N?"
    print ">"  
    if choice2 == "Y"
      puts "You chose wrong, you die :)"
    elsif  choice2 == "N"
      dragon
    else 
      puts "It's a yes or a no, my man"
    end 
  end
end


def start
  puts "You are in a castle"
  puts "There is a dragon sleeping on a pile of gold"
  puts "There is a gleaming diamond sword wedged on a rock"
  puts "Do you 1)Run 2)Approach the gold sneakily 3)Get the sword   "
  print ">"
  choice = $stdin.gets.chomp
 
  if choice == "run"
    goblin 

  elsif choice == "approach"
    dragon
  
  
  elsif choice == "get the sword"
    fight
  
  else
    puts "YOU HAVE 3 CHOICES My FREN"
  end
end

start

  
 
 
  
