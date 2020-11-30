
class App

  class Pet
    attr_reader :name, :stuff_in_belly, :mood, :sleep, :toilet
    attr_accessor :exit_, :message

    def initialize name
      @name = name
      @sleep = false      #желание сна
      @count_sleep = 10   #колличество бодрстволвания
      @stuff_in_belly = 10 #  желудок
      @toilet = 0
      @happy = 10 # Настроение
      @exit_ = false
      @message = ''
    end


    def feed
      @stuff_in_belly += 5
      @toilet += 5
      time_pass
    end

    def walk
      @happy = 10
      time_pass
    end

    def put_to_bed
      @sleep = false
      3.times { time_pass }
    end

    def go_toilet
      time_pass
      @toilet = 0
    end

    def push
      @happy -= 1
      time_pass
    end


    private


    def hungry?
      @stuff_in_belly <= 2
    end

    def mood?
      @happy == 0
    end

    def toilet?
      @toilet >= 8
    end

    def time_pass
      @message = ''

      if @stuff_in_belly > 0
        @stuff_in_belly -= 1
        @toilet += 1
      else
      @sleep = false if @sleep
      @message += "#{@name} дуже голодний"
      @exit_ = true
      end

      if @toilet >= 20
        @toilet = 0
        @message += "О!  #{@name} наклав велику кучу..."
      end

      if hungry?
        if @sleep
          @sleep = false
          @message += "#{@name} швидко відкрив очі!"
        end
        @message += "#{@name} ну прям дуже хочу їсти..."
      end

      if mood?
        @happy -= 1
        @message += "#{@name} дуже злий"
        @exit_ = true
      end

      if toilet?
        if @sleep
          @sleep = false
          @message += "#{@name} відкрива очі! "
        end
        @message += "#{@name} біжить в туалет"
      end
    end
  end

  def call(env)
    req = Rack::Request.new(env)
    links = "<center><meta charset=""utf-8"">
             <a href='/walk' >Гуляти      </a><br>
             <a href='/feed' >Кормити      </a><br>
             <a href='/put_to_bed' >Поспати      </a><br>
             <a href='/go_toilet' >Сходити в туалет      </a><br>
             <a href='/push' >Посварити      </a><br>
             <link rel=""stylesheet"" href=""https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"" integrity=""sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"" crossorigin=""anonymous"">
</center>"

    case req.path_info
    when /index/
      @@pet = Pet.new('Cowy')
      [200, {"Content-Type" => "text/html"}, [links, "<center>Імя тваринки_#{@@pet.name}_","<br>",
                                              "Спати: #{@@pet.sleep}","<br>",
                                              "Ситність: #{@@pet.stuff_in_belly}","<br>",
                                              "Туалет: #{@@pet.toilet}","<br>",
                                              "Щастя: #{@@pet.mood}","<br>",
                                              "<img src='http://s1.iconbird.com/ico/2013/9/430/w128h1281378622493catupsidedown.png' height='150' width='150' alt='тут фотка коровы'>",
                                              "<br><b>",@@pet.message,"<br><b></center>"]]


    when /walk/
      if @@pet.exit_
        [404, {"Content-Type" => "text/html"}, ["<a href='/index' >Вырастить новую коровку      </a>",
                                                "<img src='http://s1.iconbird.com/ico/2013/9/430/w128h1281378622365catacrobat.png' height='150' width='150' alt='тут фотка коровы'' height='150' width='150' alt='тут фотка коровы'>","<br>",
                                                "<br><b>",@@pet.message,"<br><b>"]]
      end
      @@pet.walk
      [200, {"Content-Type" => "text/html"}, [links, "<center>Імя тваринки_#{@@pet.name}_","<br>",
                                              "Спати: #{@@pet.sleep}","<br>",
                                              "Ситність: #{@@pet.stuff_in_belly}","<br>",
                                              "Туалет: #{@@pet.toilet}","<br>",
                                              "Щастя: #{@@pet.mood}","<br>",
                                              "<img src='http://s1.iconbird.com/ico/2013/9/430/w128h1281378622493catupsidedown.png' height='150' width='150' alt='тут фотка коровы'>",
                                              "<br><b>",@@pet.message,"<br><b></center>"]]
    when /feed/
      if @@pet.exit_
        [404, {"Content-Type" => "text/html"}, ["<a href='/index' >Вырастить новую коровку      </a>",
                                                "<img src='/media/go_to_les.jpg' height='150' width='150' alt='тут фотка коровы'>","<br>",
                                                "<br><b>",@@pet.message,"<br><b>"]]
      end
      @@pet.feed
      [200, {"Content-Type" => "text/html"}, [links, "<center>Імя тваринки_#{@@pet.name}_","<br>",
                                              "Спати: #{@@pet.sleep}","<br>",
                                              "Ситність: #{@@pet.stuff_in_belly}","<br>",
                                              "Туалет: #{@@pet.toilet}","<br>",
                                              "Щастя: #{@@pet.mood}","<br>",
                                              "<img src='http://s1.iconbird.com/ico/2013/9/430/w128h1281378622493catupsidedown.png' height='150' width='150' alt='тут фотка коровы'>",
                                              "<br><b>",@@pet.message,"<br><b></center>"]]
    when /put_to_bed/
      if @@pet.exit_
        [404, {"Content-Type" => "text/html"}, ["<a href='/index' >Вырастить новую коровку      </a>",
                                                "<img src='/media/go_to_les.jpg' height='150' width='150' alt='тут фотка коровы'>","<br>",
                                                "<br><b>",@@pet.message,"<br><b>"]]
      end
      @@pet.put_to_bed
      [200, {"Content-Type" => "text/html"}, [links, "<center>Імя тваринки_#{@@pet.name}_","<br>",
                                              "Спати: #{@@pet.sleep}","<br>",
                                              "Ситність: #{@@pet.stuff_in_belly}","<br>",
                                              "Туалет: #{@@pet.toilet}","<br>",
                                              "Щастя: #{@@pet.mood}","<br>",
                                              "<img src='http://s1.iconbird.com/ico/2013/9/430/w128h1281378622493catupsidedown.png' height='150' width='150' alt='тут фотка коровы'>",
                                              "<br><b>",@@pet.message,"<br><b></center>"]]
    when /go_toilet/
      if @@pet.exit_
        [404, {"Content-Type" => "text/html"}, ["<a href='/index' >Вырастить новую коровку      </a>",
                                                "<img src='/media/go_to_les.jpg' height='150' width='150' alt='тут фотка коровы'>","<br>",
                                                "<br><b>",@@pet.message,"<br><b>"]]
      end
      @@pet.go_toilet
      [200, {"Content-Type" => "text/html"}, [links, "<center>Імя тваринки_#{@@pet.name}_","<br>",
                                              "Спати: #{@@pet.sleep}","<br>",
                                              "Ситність: #{@@pet.stuff_in_belly}","<br>",
                                              "Туалет: #{@@pet.toilet}","<br>",
                                              "Щастя: #{@@pet.mood}","<br>",
                                              "<img src='http://s1.iconbird.com/ico/2013/9/430/w128h1281378622493catupsidedown.png' height='150' width='150' alt='тут фотка коровы'>",
                                              "<br><b>",@@pet.message,"<br><b></center>"]]
    when /push/
      if @@pet.exit_
        [404, {"Content-Type" => "text/html"}, ["<a href='/index' >Вырастить нового питомца </a>",
                                                "<img src='http://s1.iconbird.com/ico/2013/9/430/w128h1281378622441catpirate.png' height='150' width='150' alt='тут фотка коровы'>","<br>",
                                                "<br><b>", @@pet.message, "<br><b>"]]
      else
        @@pet.push
        [200, {"Content-Type" => "text/html"}, [links, "<center>Імя тваринки_#{@@pet.name}_","<br>",
                                                "Спати: #{@@pet.sleep}","<br>",
                                                "Ситність: #{@@pet.stuff_in_belly}","<br>",
                                                "Туалет: #{@@pet.toilet}","<br>",
                                                "Щастя: #{@@pet.mood}","<br>",
                                                "<img src='http://s1.iconbird.com/ico/2013/9/430/w128h1281378622493catupsidedown.png' height='150' width='150' alt='тут фотка коровы'>",
                                                "<br><b>",@@pet.message,"<br><b></center>"]]
      end

    else
      @@pet.message = "#{@@pet.name} не понимает что вы от неё хотите"
      [404, {"Content-Type" => "text/html"}, [links, "<center>Імя тваринки_#{@@pet.name}_","<br>",
                                              "Спати: #{@@pet.sleep}","<br>",
                                              "Ситність: #{@@pet.stuff_in_belly}","<br>",
                                              "Туалет: #{@@pet.toilet}","<br>",
                                              "Щастя: #{@@pet.mood}","<br>",
                                              "<img src='http://s1.iconbird.com/ico/2013/9/430/w128h1281378622493catupsidedown.png' height='150' width='150' alt='тут фотка коровы'>",
                                              "<br><b>",@@pet.message,"<br><b></center>"]]
    end
  end
end