$level = 1
$gold = 0

class Scene
  def enter()
    puts "NIl"
    exit(1) 
  end
end

class Engine

  def initialize(scene_map)
    @scene_map = scene_map
  end

  def play()
    current_scene = @scene_map.opening_scene()
    last_scene = @scene_map.next_scene('finished')

    while current_scene != last_scene
      next_scene_name = current_scene.enter()
      current_scene = @scene_map.next_scene(next_scene_name)
    end

    
    current_scene.enter()
  end
end

class Castle < Scene
  def enter()
    puts "You are in a dark, grimy castle"
    sleep 1.5
    puts "Torches illuminate the dark hallways"
    sleep 1.5
    puts "A gigantic firebreathing dragon lies in deep slumber atop a gleaming pile of gold and other magnificient treasures"
    sleep 3.5
    puts "You're hard pressed for some cash. The gold looks enticing, wyd?"
    sleep 1.5
    puts "1. Walk straight towards the monstrous thing  2.Run while you still can >.<   3.Try out a stealthy approach"
    
    var1 = $stdin.gets.chomp 
 
    if var1 == "walk"
      puts "You unsheathe your sword made out of mithril, should be able to cut through people like butter."
      sleep 3
      puts " The dragon stirs. Uh-oh Still think this is a good idea? :/ "
 
      var2 = $stdin.gets.chomp
      if  var2 == "yes"
        puts "You bravely move towards the dragon"
        sleep 1.5
        puts "Suddenly it opens it's eyes and is rudely woken out of it's deep sleep"
        sleep 1.5
        puts "He doesn't look happy."
        sleep 1.5
        puts "ROARRRRRRRR"
        puts "The dragon lets out an enormous flame and burns you to toast."
        sleep 1
        puts "Tough luck."
      return "Death"
   
      else
        puts "Smart move "
        puts "You bolt immediately"
        sleep 1.5
        puts "You found a way out of the castle!"
        return "Forest"   
      end

    elsif var1 == "run"
     puts "Whew, okay." 
     puts "You Run down the first way you see."
     sleep 1.5
     puts "A gigantic bloodthirsty bat appears out of literally nowhere"
     sleep 1.5
     puts "Do you want to try to fight?"
      return "Fightbat"
     
     # if  $result == 0
      #return "Death"
      
     # else
     # return "Forest"
     # end

    elsif var1 == "stealth"
      puts "You pull out a magical flute that you inherited from your grandad"
      sleep 1.5
      puts "Turns out it can put magical creatures to sleep"
      sleep 1.5
      puts "You pull it out and start playing it"
      sleep 1.5
      puts "The dragon ruffles a bit and settles in"
      puts "You're saved!"
      sleep 1.5
      puts "Time to swindle some treasure!. Do you take the big treasure chest or the small one?"
      var4 = $stdin.gets.chomp
   
      if  var4 == "big"
        puts "Greedy, are we?"
        sleep 1.5
        puts "You try your best to escape from the dragon with the treasure chest but it is heavy"
        sleep 3.5
        puts "You drag it across the cold stone floor of the castle"
        sleep 1.5
        puts "Whops. The dragon raises a ear."
        sleep 1.5
        puts "But he goes to sleep again"
        return "Cave"
    
      else var4 == "small"
        puts "Noice. You're not greedy :)"
        sleep 1.5
        puts "You can move faster because the chest is small."
        return "Mountain"   
      end
 
    else
      print "Type in something sensible!"
      return "Castle" 
    end  
  end 
end   


    
class Forest < scene
  def(enter)
    puts "You've somehow escaped the castle, now you find yourself in the enchanted forest, Ellesmere!"
    sleep 1.5
    puts "The sunlight pierces through the canopy of the trees"
    sleep 1.5
    puts "Legend has it that evil spirits lurk in this forest"
    sleep 1.5
    puts "A witcher had once, generations ago come here to seek the sword of truth"
    sleep 1.5
    puts "A sword of legend, with which he slayed any evil spirit and brought peace to the land"
    sleep 1.5
    puts "You decide that since you are here, you will search for the sword to help aid you in your quest"
    sleep 1.5
    puts "After wandering  around for what seems like ages, you come to a door with, what appears to be a stone face"
    sleep 1.5
    puts "WHO GOES THERE?"
    sleep 1.5
    puts "You are startled! Looks like the door is talking!"
    sleep 1.5
    puts "Hello traveller, you look like you are battle worn an
    puts "If you answer my questions, riddles they are. Find the key to the sword of legends, you shall!"
  end
end
 
   
class Fight < Scene
  def initialize(name)
    @name = name
  end

  def enter()
    puts "You face a wild monster, a #{@name}!! \n"
    
    if $level == 1
      playerap = 2
 
    elsif $level == 2
      playerap = 3
 
    else 
      playerap = 4 
    end    
  
    monsterap = rand (1..7)
    monsterhp = rand (5..20)
  
    playerhp = 10
    puts "It has a total hp of #{monsterhp}! \n"
    puts "Your sword is at level #{$level}, gulp! \n"
    puts "And your hp is 10! \n"
    puts "Time to brave up, it's fight night. \n"
  
    while playerhp > 0
      puts "Time for an attack, press x to unleash the fury of your sword! \n"
      var3 = $stdin.gets.chomp  
    
      if  var3 == "x"
        puts "HYAAA! you gave the monster a good whack with your epic sword! \n"
        monsterhp = monsterhp-playerap
       
        if monsterhp <=0
          puts "The monster is dead mwahahah! GG \n \n"
          break
        end

        print "Monster hp is now #{monsterhp} \n"
        puts "Time for the counterattack! The monster gets ready...and PLOW!, deals damage! \n"
        playerhp = playerhp - monsterap

        if  playerhp <=0
          puts "Your hp becomes zero!"
          break
        end

        print "Your hp is now #{playerhp} \n"  
   
      else
        print "You pressed the wrong button! \n"
        print "The monster takes this chance and deals damage! \n"
        playerhp = playerhp - monsterap
        print "Your hp is now #{playerhp} \n"
      end
    end  
 
    if monsterhp == 0
      if @name == "Bloodthirsty Gigantic Bat"
        return "Castle"
      end
    end

    if playerhp == 0
      return "Death" 
    end      
  end
end

class Death < Scene
  def enter()
    puts "You're dead :( Rip"
    exit(1)
  end
end

class Finished < Scene
  def enter()
    puts "It's over"
  end
end

class Map
  @@scenes = {
    'Castle' => Castle.new(),
    'Fightbat' => Fight.new("Bloodthirsty Gigantic Bat"),
    'Death' => Death.new(),
    'Finished' => Finished.new()
  #  'Forest' => Forest.new() 
 }


  def initialize(start_scene)
    @start_scene = start_scene
  end


  def next_scene(scene_name)
    val = @@scenes[scene_name]
    return val
  end

  def opening_scene()
    return next_scene(@start_scene)
  end
end

a_map = Map.new('Castle')
a_game = Engine.new(a_map)
a_game.play()
