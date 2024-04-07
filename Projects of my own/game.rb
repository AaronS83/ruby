require 'pry-byebug'

class Vikings
    attr_accessor :name, :armour,:health 
    attr_reader :attack_power
    @@id=0
    
    def initialize(name, attack_power, armour)
      @@id+=1
      @name=name
      @health = 10
      @attack_power = attack_power
      @armour = armour
      puts "#{@name} has #{@armour} armour and #{@attack_power} attack"
      puts
    end
  
    def attack(enemy)
      unless (self.is_dead? || enemy.is_dead?)
        # binding.pry
        if enemy.armour > 0
          damage = self.attack_power * 0.8
          if damage < enemy.armour
            enemy.armour -= damage
          else
            enemy.armour = 0
          end
        else 
          damage = self.attack_power
        end
        # binding.pry
        enemy.health-=damage
        puts "#{self.name} attacks #{enemy.name} for #{damage}"
        puts "#{enemy.name} has #{enemy.health<0? 0 : enemy.health} health left \n"
        puts
      end
    end
  
    def is_dead?
      if self.health <= 0
        true 
      else 
        false
      end
    end

    def self.id_number
        "This is the latest id number: #{@@id}\n\n"
    end
end
  
def turn(p1,p2)
    p1.attack(p2)
    p2.attack(p1)
end

# We can add subclasses that inherit the properties of viking, like saxon that have their own armour and attack points later.
# Can add items and different attacks and counter attacks
#   can add accuracy or probablitiy for the attack to miss

puts "Enter your name(Player 1): "
name = gets.chomp
attack_power = rand(1..10)
armour = rand(1..5)
player1 = Vikings.new(name, attack_power, armour)
  
puts "Enter your name(Player 2): "
name = gets.chomp
attack_power = rand(1..10)
armour = rand(1..5)
player2 = Vikings.new(name, attack_power,armour)
  
until (player1.is_dead? || player2.is_dead?)
  puts "player 1 rolls the die and gets #{result_1=rand(1..6)}"
  puts "player 2 rolls the die and gets #{result_2=rand(1..6)}"
  puts
  if result_1>result_2
    turn(player1, player2)
  else
    turn(player2, player1)
  end
end

puts "#{player1.name} is now dead and has lost the battle!" if player1.is_dead?
puts "#{player2.name} is now dead and has lost the battle!" if player2.is_dead?
  
#player 1 alwayes wins, need to improve the balance of the game