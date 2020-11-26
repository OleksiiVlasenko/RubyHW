# frozen_string_literal: true

require_relative 'pet'
require_relative 'dog'
require_relative 'cat'


class User

  def check_session
    YAML.load(File.read("db/session.yml")).to_s
  end

  def start
    p "Welcome, you are login as #{check_session.capitalize}"
    new_pet
    @pet.emoji
    @pet.push_html
    loop(&method(:chose_command))
  end

  def new_pet
    until @type == 'dog' || @type == 'cat'
      p 'Як Ви хочете назвати вашу тваринку ? '
      @name = gets.chomp
      p 'Напишіть dog або cat, щоб вибрати ким хочете грати.'
      @type = gets.chomp.downcase
      if @type == 'dog'
        @pet = Dog.new(@name)
      else @type == 'cat'
           @pet = Cat.new(@name)
      end
    end
    p "Привіт друже, я самий найкращий #{@type} і мене звати #{@pet.name}."
    @pet.help
    @pet.pet_comand
  end

  private

  def chose_command
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
    when 'kill'
      @pet.kill if check_session == 'super'
      @pet.push_html
    when '11'
      @pet.pet_comand
    when '12'
      @pet.casino
      @pet.push_html
    when '13'
      @pet.say
      @pet.push_html
    when '14'
      @pet.help
      @pet.push_html
    when 'html'
      ContenToHtml.new.open_html
    when 'char'
      @pet.super_change_char if check_session == 'super'
      @pet.admin_change_char if check_session == 'admin'
      @pet.push_html
    when 'reset'
      @pet.char_reset if check_session == 'super'
      @pet.push_html
    when '0'
      exit
    else
      p 'Вибачте, спробуйте заново команду (загальний список команд 11)'
    end
  end
end
