# frozen_string_literal: true

require_relative 'pet_methods'

class Pet

  def initialize(name, type, owner)
    @name = name      # name
    @type = type      # animal type
    @owner = owner    # animal owner
    @hunger = 10      # hungry lvl
    @happy = 10       # happy lvl
    @asleep = false   # asleep status
    @cleanliness = 0  # toilet lvl
    @live = 2         # lives
    @water = 10       # water lvl
    help
    pet_comand
    start
  end

  def pet_comand
    p '------------------------------------------------------------------'
    p '| Комманды:'
    p '| 0 Вийти з гри'
    p '| 1 Привітатись'
    p '| 2 бавитись(+2 щастя -2 бажання поїсти -2 води)'
    p '| 3 їсти (+2 ситності +2 туалет +2 води)'
    p '| 4 займатись різними видами спорту(+2 щастя -2 ситності -2 води)'
    p '| 5 прогулюватись(+2 щастя -2 ситності -2 води)'
    p '| 6 плавати(+3 щастя -2 ситності -2 води)'
    p '| 7 нічого не робити (Поспати годинку -2 щастя -2 ситності -2 води)'
    p '| 8 вивести в туалет (0 туалет -1 ситності -2 води)'
    p '| 9 поспати '
    p '| 10 Стан тваринки '
    p '| 11 Вбити тваринку'
    p '| 12 Список команд'
    p '| Введіть номер команди (тільки цифру)'
  end

  def help
    p '| ----------------------------------------------------------------'
    p '| Щоб почати грати напишіть номер команди яку ви хочете виконати'
    p '| Ваша тваринка, хотіти'
    p '| Спочатку у вашої тваринки: '
    p '| 10 ситності'
    p '| 10 щастя'
  end

  def start
    command = 1
    until command == '0'
      die if @hunger <= 0
      command = gets.chomp.downcase
      case command
      when '1'
        new_pet
      when '2'
        play
      when '3'
        feed
      when '4'
        sport
      when '5'
        walk
      when '6'
        swim
      when '7'
        p "#{time_pass} **#{@name} проспав цілий день."
      when '8'
        toilet
      when '9'
        timetosleep
      when '10'
        status
      when '11'
        kill
      when '12'
        pet_comand
      when '0'
        exit
      else
        p "Вибачте, але цієї команди не існує: #{command}, напишіть 12 щоб дізнатись список команд"
      end
    end
  end

  private :start, :pet_comand, :help
end

dragon = Pet.new('Nickson', 'Dog', 'Oleksii')
