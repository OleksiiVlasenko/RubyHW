require_relative 'pet'
require_relative 'dog'
require_relative 'cat'


class Menu

  def start
    new_pet

    while true
    command = gets.chomp.downcase
      case command
      when '1'
        @pet.mining
      when '2'
        @pet.play
      when '3'
        @pet.feed
      when '4'
        @pet.sport
      when '5'
        @pet.walk
      when '6'
        @pet.swim
      when '7'
        p "#{@pet.time_pass} **#{@name} проспав цілий день."
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
      when '0'
        exit
      else
        p "Вибачте, але цієї команди не існує: #{command}, напишіть 12 щоб дізнатись список команд"
      end
    end
  end

  def new_pet

    p 'Як буде звати вашу тваринку ? '
    name = gets.chomp
    p 'Напишіть dog чи cat'
    type = gets.chomp.downcase
    if type == 'dog'
      @pet = Dog.new(name)
    elsif type == 'cat'
      @pet = Cat.new(name)
    else
      p = p 'Не знаю такої тваринки'
    end
    p "Привіт я #{type} і мене звати #{@pet.name}."
    @pet.help
    @pet.pet_comand
  end

end

Menu.new.start