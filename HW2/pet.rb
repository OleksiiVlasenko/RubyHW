# frozen_string_literal: true
require_relative 'pet_methods'
class Pet

  def initialize(name, type, owner)
    @name = name      # ім'я
    @type = type      # клас тваринки
    @owner = owner    # власник тваринки
    @hunger = 10      # рівень голоду
    @happy = 10       # рівень щастя
    @asleep = false   # стан тваринки спить, не спить
    @cleanliness = 0 # рівень бажання сходити до туалету
    @live = 2
    help
    pet_comand
    start
  end

  def time_pass
    if @hunger >= 0
      @hunger -= 1
      @happy -= 1
      @cleanliness += 1
    else
      asleep_f if @asleep
      @live -=1
      p "** #{@name} втратив одне життя" if @live == 1
      p "** #{@name} втратив останнє життя" if @live.zero?
      p "** #{@name} треба нагально покормити, бо помре" if @live.zero?
    end
    if @cleanliness >= 10
      @cleanliness = 0
      p "** #{@name} раптово сходив в туалет на любиму ковдру, треба частіше вигулювати"
    end
    asleep_f if hungry?
    rnd = rand(3)
    case rnd
    when 0
      p "** #{@name} я хочу їсти" if @hunger.positive?
    when 1
      p "** #{@name} пюрешечки да с котлеткой би ...." if @hunger.positive?
    when 2
      p "** #{@name} накорми мене ..." if @hunger.positive?
    else
      p ' - Я не буду з тобою більше гуляти!'
    end
    die
    angry
  end



  def pet_comand
    p '------------------------------------------------------------------'
    p '| Комманды:'
    p '| 0 Вийти з гри'
    p '| 1 Привітатись'
    p '| 2 бавитись(+2 щастя -2 бажання поїсти)'
    p '| 3 їсти (+2 ситності +2 туалет)'
    p '| 4 займатись різними видами спорту(+2 щастя -2 ситності)'
    p '| 5 прогулюватись(+2 щастя -2 ситності)'
    p '| 6 плавати(+3 щастя -2 ситності)'
    p '| 7 нічого не робити (Проспати цілий день-3 щастя -3 ситності)'
    p '| 8 вивести в туалет (0 туалет -2 ситності)'
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
    command = ''
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
        time_pass
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



  private :die, :walk, :happy?, :poop?, :toilet, :status, :hungry?, :poop?, :status, :timetosleep, :time_pass, :feed,
          :play, :asleep_f, :sport, :swim, :new_pet, :start, :help, :pet_comand, :kill
end

dragon = Pet.new('Nickson', 'Dog', 'Oleksii')
