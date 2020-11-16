require_relative 'pet'
require_relative 'dog'
require_relative 'cat'


class Menu
  def start
    new_pet
    loop do
      command = gets.strip.downcase
      case command
      when '1'
        @pet.mining
        @pet.create_html
      when '2'
        @pet.play
        @pet.create_html
      when '3'
        @pet.feed
      when '4'
        @pet.sport
      when '5'
        @pet.walk
      when '6'
        @pet.swim
      when '7'
        p "**#{@name} проспав цілий день."
        @pet.send(:time_pass)
      when '8'
        @pet.toilet
      when '9'
        @pet.timetosleep
      when '10'
        @pet.status
      when '11'
        @pet.kill
      when '12'
        @pet.pet_comand
      when '13'
        @pet.casino
      when '14'
        @pet.say
      when '15'
        @pet.help
      when '0'
        exit
      else
        p 'Вибачте, спробуйте заново команду (загальний список команд 12)'
      end
    end
  end

  def new_pet
    until @type == 'dog' || @type == 'cat'
      p 'Як Ви хочете назвати вашу тваринку ? '
      @name = gets.chomp
      p 'Напишіть dog або cat, щоб вибрати ким хочете грати.'
      @type = gets.chomp.downcase
      if @type == 'dog'
        @pet = Dog.new(@name)
      elsif @type == 'cat'
        @pet = Cat.new(@name)
      else
        p 'Вибачте але я не знаю такої тваринки, спробуйте ще раз!'
      end
    end
    p "Привіт друже, я самий найкращий #{@type} і мене звати #{@pet.name}."
    @pet.help
    @pet.pet_comand
    end
end

Menu.new.start
