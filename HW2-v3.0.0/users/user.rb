require_relative '../pet'
require_relative '../dog'
require_relative '../cat'


class User

  def start
    p "Welcome, you are loggened as Guest"
    new_pet
    @pet.emoji
    @pet.push_html
    loop do
      command = gets.strip.downcase
      case command
      when '1'
        @pet.mining
        @pet.push_html
      when '2'
        @pet.play
        @pet.push_html
      when '3'
        @pet.feed
        @pet.push_html
      when '4'
        @pet.sport
        @pet.push_html
      when '5'
        @pet.walk
        @pet.push_html
      when '6'
        @pet.swim
        @pet.push_html
      when '7'
        p "**#{@name} проспав цілий день."
        @pet.send(:time_pass)
        @pet.push_html
      when '8'
        @pet.toilet
        @pet.push_html
      when '9'
        @pet.timetosleep
        @pet.push_html
      when '10'
        @pet.status
        @pet.push_html
      when '12'
        @pet.pet_comand
      when '13'
        @pet.casino
        @pet.push_html
      when '14'
        @pet.say
        @pet.push_html
      when '15'
        @pet.help
        @pet.push_html
      when 'html'
        ContenToHtml.new.open_html
      when 'char'
        @pet.super_change_char if 'super' == check_session
        @pet.admin_change_char if 'admin' == check_session
        @pet.push_html
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
