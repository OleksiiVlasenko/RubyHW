# frozen_string_literal: true

require 'cont_to_html'
require 'yaml'

class Pet
  attr_accessor :name, :hunger, :happy, :asleep, :cleanliness, :life, :water, :money, :lvl, :exp, :emoji

  def initialize(name)
    @name = name      # name
    @hunger = 10      # hungry lvl
    @happy = 10       # happy lvl
    @asleep = false   # asleep status
    @cleanliness = 0  # toilet lvl
    @life = 1         # lives
    @water = 10       # water lvl
    @money = 0
    @lvl = 0
    @exp = 0
    @emoji = ''
    @time_create = Time.new
    @lifetime = ''
    @owner = ''
    @type = ''
    load_temp
    emoji_by_type
  end

  def load_temp
    temp = YAML.load(File.read("db/pet.yml"))
    @owner = temp[0]
    @type = temp[1]
  end

  def save_to_yaml
    yaml_db = { name: @name,
                hunger: @hunger,
                happy: @happy,
                asleep: @asleep,
                cleanliness: @cleanliness,
                life: @life,
                water: @water,
                money: @money,
                lvl: @lvl,
                exp: @exp,
                emoji: @emoji }
    File.open("db/pet.yml", "w") { |file| file.write(yaml_db.to_yaml) }
  end

  def check_session
    YAML.load(File.read("db/session.yml")).to_s
  end

  def pet_comand
    p '------------------------------------------------------------------------------'
    p '| Виберіть команду :'
    p '| 0 Вийти з гри | 1 майнити | 2 бавитись | 3 їсти | 4 займатись спортом |'
    p '| 5 гуляти | 6 плавати | 7 нічого не робити | 8 сходити в туалет | '
    p '| 9 проспати цілий день | 10 Статус тваринки'
    p '| 11 список команд | 12 Гра ⒸⒶⓈⒾⓃⓄ | 13 Попестити | 14 Допомога'
    p '| Напишіть html щоб відкрити в браузері'
    p '| Введіть номер команди і натисніть Enter (тільки цифру)'
    p '| char Для зміни імені тваринки' if 'super' == check_session || 'admin' == check_session
    p '| kill Вбивти тваринку |' if 'super' == check_session
    p '| reset обнулити тваринку' if 'super' == check_session
  end

  def help
    p '------------------------------------------------------------------------------'
    p '| Гра Тамагочі from RubyCops'
    p "| Для початку задайте і'мя вашої тваринки та її вид"
    p '| Далі щоб почати грати напишіть номер команди яку ви хочете виконати'
    p '| Початкові х-ки у вашої тваринки: '
    p '| 10 ситності'
    p '| 10 води'
    p '| 10 щастя'
    p '| 0 туалет'
    p "| #{@life} життя(ів)"
    p '| 0 золота'
    p '| 0 рівень'
    p '| 0 досвіду'
    p '| Після виконання команди, з ліва від неї буде інформація про тип х-ки '
    p '| з якою проводиться модифікація, будьте уважними, тваринка не постійна...'
    p '------------------------------------------------------------------------------'
    p '| Команди:'
    p '| 0 Вийти з гри'
    p '| 1 майнити поки хазяїн спить 1..5 золота +10 досвіду'
    p '| 2 бавитись(+2 щастя -2 бажання поїсти -2 води +2 туалет +10 досвіду)'
    p '| 3 їсти (+2 ситності +2 туалет +2 води)'
    p '| 4 займатись різними видами спорту(+2 щастя -2 ситності -2 води +2 туалет +10 досвіду)'
    p '| 5 прогулюватись(+2 щастя -2 ситності -2 води +2 туалет +10 досвіду)'
    p '| 6 плавати(+3 щастя -2 ситності -2 води +2 туалет +10 досвіду)'
    p '| 7 нічого не робити (Поспати годинку -2 щастя -2 ситності -2 води +2 туалет +10 досвіду)'
    p '| 8 сходити в туалет (0 туалет -1 ситності -2 води)'
    p '| 9 проспати цілий день (-4 щастя -4 ситності -4 води +4 туалет)'
    p '| 10 Статус тваринки '
    p '| 11 Список команд'
    p '| 12 Гра ⒸⒶⓈⒾⓃⓄ'
    p '| 13 Попестити +1 щастя'
    p '| 14 Інформація по грі'
    p '| char Для зміни імені тваринки' if 'super' == check_session || 'admin' == check_session
    p '| Напишіть html щоб відкрити в браузері'
    p '| kill Вбити тваринку' if 'super' == check_session
    p '| reset обнулити тваринку' if 'super' == check_session
    p 'Введіть номер команди і натисніть enter'
  end

  def status
    lifetime
    p "Власник     : #{@owner}"
    p "Ім'я        : #{@name}"
    p "Рівень      : #{@lvl}"
    p "Досвід      : #{@exp}"
    p "Ситність    : #{@hunger}"
    p "Вода        : #{@water}"
    p "Щастя       : #{@happy}"
    p "Туалет      : #{@cleanliness}"
    p "Життя       : #{@life}"
    p "Золото      : #{@money}"
    p "Час життя   : #{@lifetime}хв"
    p 'Введіть команду (загальний список команд 11)' if @life != 0 || @happy != 0
  end

  def super_change_char
    p 'Ви хочете змінити характеристику'
    char = gets.strip.downcase
    case char
    when 'name'
      @name = ask_val
      inform
    when 'lvl'
      @lvl = ask_val
      inform
    when 'exp'
      @exp = ask_val
      inform
    when 'hunger'
      @hunger = ask_val
      inform
    when 'water'
      @water = ask_val
      inform
    when 'happy'
      @happy = ask_val
      inform
    when 'cleanliness'
      @cleanliness = ask_val
      inform
    when 'life'
      @life = ask_val
      inform
    when 'money'
      @money = ask_val
      inform
    when 'reset'
      char_reset
      inform
    else
      p 'Вибачте, спробуйте заново команду (загальний список команд 11)'
    end
  end

  def admin_change_char
    p 'Ви хочете змінити характеристику'
    char = gets.strip.downcase
    case char
    when 'name'
      @name = ask_val
      inform
    else
      p 'Вибачте, але немає такої команди спробуйте заново (загальний список команд 11)'
    end
  end

  def ask_val
    p 'Введіть значення на яке хочете змінити'
    gets.strip.downcase
  end

  def char_reset
    @hunger = 10
    @happy = 10
    @asleep = false
    @cleanliness = 0
    @life = 1
    @water = 10
    @money = 0
    @lvl = 0
    @exp = 0
    @emoji = ''
    p 'Характеристики були змінені на дефолтні'
  end

  def emoji_by_type
    @emoji_type = '&#128008;' if @type == 'cat'
    @emoji_type = '&#128021;' if @type == 'dog'
  end

  def push_html(filename = 'index.html')
    lifetime
    content = "
    <style>
    /* Стили таблицы (IKSWEB) */
    table.iksweb{text-decoration: none;border-collapse:collapse;width:100%;text-align:center;}
    table.iksweb th{font-weight:normal;font-size:14px; color:#ffffff;background-color:#354251;}
    table.iksweb td{font-size:13px;color:#354251;}
    table.iksweb td,table.iksweb th{white-space:pre-wrap;padding:10px 5px;line-height:13px;vertical-align: middle;border: 1px solid #910dbd;}	table.iksweb tr:hover{background-color:#e4e685}
    table.iksweb tr:hover td{color:#354251;cursor:default;}
    </style>
    <h1>Гра Тамагочі from RubyCops &#127482;&#127462;</h1>
    <p>Власник  <b>#{@owner.capitalize}</b></p>
    <p>Ви авторизовані як <b>#{check_session.capitalize}</b></p>
    <p><b>#{@owner.capitalize}</b> назвав мене <b>#{@name} Я #{@emoji_type}</b> і мій стан - #{@emoji}</p>
    <table class=""iksweb"">
		<tr>
			<td>Рівень</td>
			<td>Досвід</td>
			<td>Ситність</td>
			<td>Вода</td>
			<td>Щастя</td>
			<td>Туалет</td>
			<td>Життя</td>
			<td>Золото</td>
		</tr>
		<tr>
			<td>#{@lvl}</td>
			<td>#{@exp}</td>
			<td>#{@hunger}#{@hunger >= 5 ? '&#x1f601;' : '&#129314'}</td>
			<td>#{@water}#{@water >= 5 ? '&#x1f601;' : '&#128545'}</td>
			<td>#{@happy}#{@happy >= 5 ? '&#x1f601;' : '&#129324;'}</td>
			<td>#{@cleanliness}#{@hunger >= 5 ? '&#x1f601;' : '&#128553;'}</td>
			<td>#{@life}#{@life >= 1 ? '&#128526' : '&#128128'}</td>
			<td>#{@money}#{@money >= 2 ? '&#128126' : '&#129396;'}</td>
		</tr>
    </table>
    <p> Час життя : <b>#{@lifetime}</b> хв</p>
    <p> Щоб погратись зі мною виконуй команди в консолі </p>
    <h6> Повністю браузерна версія планується в наступному оновленні :) </h6>"
    ContenToHtml.new.update(content, filename) if File.exist?(filename)
    ContenToHtml.new.create_html(content, true, filename) unless File.exist?(filename)
    save_to_yaml

  end

  def lvl_up
    if @exp >= 100
      @lvl += 1
      @exp = 0
      p "|Рівень| **#{@name} досяг ще одного рівня. #{@name} тепер #{@lvl} рівня"
    end
  end

  def mining
    gold = rand(1..5)
    p "|Золото| #{@name} заробляє #{gold} золота на майнінгу"
    @money += gold
    @exp += 10
    p 'Введіть команду (загальний список команд 11)'
  end

  def say
    p "**#{name} привіт як у тебя справи?"
    @happy = set_change(@happy, 1)
  end

  def casino
    p ' - ⒸⒶⓈⒾⓃⓄ - '
    p "У вас на рахунку : #{@money}"
    bet = rand(-10..10)
    if !@money.zero? && !@money.negative?
      p "Ставка : #{bet}"
      if bet.positive?
        p "|Золото| - ⓌⒾⓃ - Ви вийграли #{bet} золота"
        @money += bet
        p "У вас на рахунку: #{@money}"
        p 'Щоб продовжити грати напишіть 12, загальний список команд 11'
      else
        p "|Золото| - ⓁⓄⓈⒺ - Ви програли #{bet} золота"
        @money -= bet.abs
        p "У вас на рахунку: #{@money}" if @money.positive?
        p "Ви взяли в кредит: #{@money}" if @money.negative?
        p 'Щоб продовжити грати напишіть 12, загальний список команд 11'
      end
    else
      p "|Золото| У вас #{@name} немає золота щоб робити ставку"
    end
  end

  def emoji
    @emoji = @happy >= 5 ? '&#128522' : '&#128561;'
  end

  def lose_life
    @life -= 1
    p "|Життя| #{@name}  втратив одне життя" if @life != 1
    p "|Життя| #{@name}  треба нагально покормити, бо помре" if @life == 1
    p "|Життя| #{@name}  втратив останнє життя" if @life.zero?
  end

  def time_pass
    if @hunger >= 0
      @hunger = set_change(@hunger, -2)
      @happy = set_change(@happy, -2)
      @water = set_change(@water, -2)
      @cleanliness = set_change(@cleanliness, 2)
    else
      asleep_f if @asleep
      lose_life
    end
    if @cleanliness >= 10
      @cleanliness = 0
      p "|Туалет| #{@name}  раптово сходив в туалет на любиму ковдру, треба частіше вигулювати"
    end
    if hungry?
      asleep_f
      rnd = rand(3)
      case rnd
      when 0
        p "|Ситність| #{@name} я хочу їсти" if @life != 0
      when 1
        p "|Ситність| #{@name}  накорми мене, пюрешечки да с котлеткой би ...." if @life != 0
      when 2
        p "|Ситність| #{@name}  накорми мене, бо з'їм тебе в ночі..." if @life != 0
      else
        p '|Ситність| - я скоро захочу їсти!'
      end
    end
    die
    angry
    lvl_up
    love
    toilet if @cleanliness >= 8
    inform
    emoji
    lifetime
  end

  def set_change(param, value)
    if param >= 1
      param.between?(0, 90) ? param + value : 100
    else
      param >= 1 ? param + value : 0
    end
  end

  def feed
    @hunger = set_change(@hunger, 2)
    @water = set_change(@water, 2)
    # @cleanliness = set_change(@cleanliness, 2)
    @cleanliness += 2
    toilet if @cleanliness >= 8
    p "|Ситність| #{@name} поїв, ммм, дуже смачно"
    inform
  end

  def asleep_f
    @asleep = false
    rnd = rand(3)
    case rnd
    when 0
      p "** #{@name} невпинно дивиться на вас" if @life != 0
    when 1
      p "** #{@name} підійшов по ближче і дивиться вам в очі" if @life != 0
    when 2
      p "** #{@name} сидить сумує ... " if @life != 0
    else
      @asleep = true
    end
  end

  def timetosleep
    p "** #{@name} солодко засипа у вас на руках ..."
    @water = set_change(@water, -4)
    @happy = set_change(@happy, -4)
    @hunger = set_change(@hunger, -4)
    @cleanliness = set_change(@cleanliness, +4)
    @asleep = true
    time_pass
    2.times do
      if @asleep
        p "#{@name} - солоденько спить .... хррр хррр... хрр.... ."
        p "#{@name} - ... хррр хррр... хрр....хфьююю ."
        p "#{@name} - зіває і далі спить ... хррр хррр... хрр....хфьююю ."
      end
    end
    if @asleep
      @asleep = false
      p "** #{@name} повільно відкрива оч відкрива очі ."
    end
  end

  def love
    rnd = rand(5)
    case rnd
    when 0
      p "|Щастя| #{@name} дуже щасливий і обнімає вас" if @happy > 8
    when 1
      p "|Щастя| #{@name}  дуже щасливий і любить вас " if @happy > 9
    when 2
      p "|Щастя| #{@name} душі в вас нечаїть" if @happy > 10
    else
      @asleep = false
    end
  end

  def angry
    rnd = rand(6)
    case rnd
    when 0
      p "|Щастя| #{@name} розізлився на вас" if @happy < 5
    when 1
      p "|Щастя| #{@name} вкусив вас " if @happy < 3
    when 2
      p "|Щастя| #{@name} спробував на вас напасти" if @happy < 2
    else
      @asleep = false
    end
  end

  def hungry?
    @hunger < 3 ? true : false
  end

  def happy?
    @hunger > 3 ? true : false
  end

  def play
    if happy?
      rnd = rand(3)
      case rnd
      when 0
        p "|Щастя| #{@name} |грається з м'ячиком"
      when 1
        p "|Щастя| #{@name} став пілотом справжнього літака"
      when 2
        p "|Щастя| #{@name} покоряє вершину гори на подвір'ї"
      else
        p ' - Я трохи хочу відпочити!'
      end
      time_pass
      @happy = set_change(@happy, +4)
      @exp += 10
    else
      p "|Щастя| #{@name} ще не має бажання гратись"
      inform
    end
  end

  def poop?
    @cleanliness >= 6
  end

  def toilet
    if poop?
      p "|Туалет| #{@name} упс, сходив в куточку в туалет"
      @cleanliness = 0
      @hunger = set_change(@hunger, -1)
      @water = set_change(@water, -1)
    else
      p "|Туалет| #{@name} скоро захоче в туалет ..."
    end
  end

  def lifetime
    @lifetime = (Time.now-@time_create).round/60
  end

  def die
    if @life.zero? || (@happy <= 0 && @hunger <= 0)
      @emoji = '&#128565;'
      push_html
      p "『RɨP』〘#{@name}♔〙"
      p "✝✝✝ #{@name} помер, його смерть на вашій совісті ✝✝✝"
      p "#{@name} прожив #{@lifetime} хв."
      ContenToHtml.new.open_html
      exit
    end
  end

  def kill
    @life = 0
    die
  end

  def inform
    p 'Введіть команду (загальний список команд 11)'
  end

  def sport
    p "|Щастя| #{@name} займається спортом"
    @happy = set_change(@happy, + 4)
    @exp += 10
    time_pass
  end

  def swim
    p "|Щастя| #{@name} плаває в басейні"
    @happy = set_change(@happy, + 5)
    @exp += 10
    time_pass
  end

  def walk
    @exp += 10
    rnd = rand(3)
    p "|Щастя| #{@name} пішов гуляти на вулицю ..."
    case rnd
    when 0
      p '|Інформація| - З тобою гуляти саме заловолення!'
    when 1
      p '|Інформація| - Як сьогодні гарно на вулиці :)'
    when 2
      p '|Інформація| - А вчора ми гуляли довше!'
    else
      p '|Щастя| - щось нічого не хочеться!'
    end
    @happy = set_change(@happy,4)
    time_pass
  end

  def check_session
    YAML.load(File.read("db/session.yml")).to_s
  end

  private :time_pass, :inform, :die, :lifetime, :poop?, :check_session,
          :ask_val, :lvl_up, :lose_life, :set_change, :asleep, :hungry?, :happy?
end
