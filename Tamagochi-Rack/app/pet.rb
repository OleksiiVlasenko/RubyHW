
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
        @message += "#{@name} хоче в туалет"
      end
    end
  end

  def call(env)
    req = Rack::Request.new(env)
    links = "<center><meta charset=""utf-8"">
<div class=""list-group"">
  <a href='/walk' class='list-group-item list-group-item-action list-group-item-primary'>Гуляти</a>
  <a href='/feed' class='list-group-item list-group-item-action list-group-item-success'>Кормити</a>
    <a href='/put_to_bed' class='list-group-item list-group-item-action list-group-item-dark'>Поспати</a>
  <a href='/go_toilet' class='list-group-item list-group-item-action list-group-item-warning'>Сходити в туалет</a>
    <a href='/push' class='list-group-item list-group-item-action list-group-item-danger'>Посварити</a>
</div>

             <link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css' integrity='sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2' crossorigin='anonymous'>
<script src='https://code.jquery.com/jquery-3.5.1.slim.min.js' integrity='sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj' crossorigin='anonymous'></script>
    <script src='https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js' integrity='sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN' crossorigin='anonymous'></script>
    <script src='https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js' integrity='sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s' crossorigin='anonymous'></script>
</center>"

    case req.path_info
    when /index/
      @@pet = Pet.new('Петрович')
      [200, {"Content-Type" => "text/html"}, [links, "<center><ul class='list-group'>",
                                              "<li class='list-group-item'>Спати: #{@@pet.sleep}</li>",
                                              "<li class='list-group-item'> Ситність: #{@@pet.stuff_in_belly}</li>",
                                              "<li class='list-group-item'> Туалет: #{@@pet.toilet}</li>",
                                              "<li class='list-group-item'> Щастя: #{@@pet.mood}</li>",
                                              "<li class='list-group-item'> <img src='http://s1.iconbird.com/ico/2013/8/428/w128h1281377930231cateyes2.png' height='150' width='150' alt='тут фотка коровы'></li></ul></center>"]]

    when /walk/
      if @@pet.exit_
        [404, {"Content-Type" => "text/html"}, ["<a href='/index' >Вырастить новую коровку      </a>",
                                                "<img src='http://s1.iconbird.com/ico/2013/9/430/w128h1281378622365catacrobat.png' height='150' width='150' alt='тут фотка коровы'' height='150' width='150' alt='тут фотка коровы'>","<br>",
                                                "<br><b>",@@pet.message,"<br><b>"]]
      end
      @@pet.walk
      [200, {"Content-Type" => "text/html"}, [links, "<center><ul class='list-group'>",
                                              "<li class='list-group-item'> Спати: #{@@pet.sleep}</li>",
                                              "<li class='list-group-item'> Ситність: #{@@pet.stuff_in_belly}</li>",
                                              "<li class='list-group-item'> Туалет: #{@@pet.toilet}</li>",
                                              "<li class='list-group-item'> Щастя: #{@@pet.mood}</li>",
                                              "<li class='list-group-item'> <img src='http://s1.iconbird.com/ico/2013/8/428/w128h1281377930286catslippers2.png' height='150' width='150' alt='тут фотка коровы'></li></ul></center>"]]
    when /feed/
      if @@pet.exit_
        [404, {"Content-Type" => "text/html"}, ["<a href='/index' >Вырастить новую коровку      </a>",
                                                "<img src='/media/go_to_les.jpg' height='150' width='150' alt='тут фотка коровы'>","<br>",
                                                "<br><b>",@@pet.message,"<br><b>"]]
      end
      @@pet.feed
      [200, {"Content-Type" => "text/html"}, [links, "<center><ul class='list-group'>",
                                              "<li class='list-group-item'> Спати: #{@@pet.sleep}</li>",
                                              "<li class='list-group-item'> Ситність: #{@@pet.stuff_in_belly}</li>",
                                              "<li class='list-group-item'> Туалет: #{@@pet.toilet}</li>",
                                              "<li class='list-group-item'> Щастя: #{@@pet.mood}</li>",
                                              "<li class='list-group-item'> <img src='http://s1.iconbird.com/ico/2013/8/428/w128h1281377930238catfish2.png' height='150' width='150' alt='тут фотка коровы'></li></ul></center>"]]
    when /put_to_bed/
      if @@pet.exit_
        [404, {"Content-Type" => "text/html"}, ["<a href='/index' >Вырастить новую коровку      </a>",
                                                "<img src='/media/go_to_les.jpg' height='150' width='150' alt='тут фотка коровы'>","<br>",
                                                "<br><b>",@@pet.message,"<br><b>"]]
      end
      @@pet.put_to_bed
      [200, {"Content-Type" => "text/html"},  [links, "<center><ul class='list-group'>",
                                               "<li class='list-group-item'> Спати: #{@@pet.sleep}</li>",
                                               "<li class='list-group-item'> Ситність: #{@@pet.stuff_in_belly}</li>",
                                               "<li class='list-group-item'> Туалет: #{@@pet.toilet}</li>",
                                               "<li class='list-group-item'> Щастя: #{@@pet.mood}</li>",
                                               "<li class='list-group-item'> <img src='http://s1.iconbird.com/ico/2013/9/430/w128h1281378622418catlaptop.png' height='150' width='150' alt='тут фотка коровы'></li></ul></center>"]]
    when /go_toilet/
      if @@pet.exit_
        [404, {"Content-Type" => "text/html"}, ["<a href='/index' >Вырастить новую коровку      </a>",
                                                "<img src='/media/go_to_les.jpg' height='150' width='150' alt='тут фотка коровы'>","<br>",
                                                "<br><b>",@@pet.message,"<br><b>"]]
      end
      @@pet.go_toilet
      [200, {"Content-Type" => "text/html"}, [links, "<center><ul class='list-group'>",
                                              "<li class='list-group-item'> Спати: #{@@pet.sleep}</li>",
                                              "<li class='list-group-item'> Ситність: #{@@pet.stuff_in_belly}</li>",
                                              "<li class='list-group-item'> Туалет: #{@@pet.toilet}</li>",
                                              "<li class='list-group-item'> Щастя: #{@@pet.mood}</li>",
                                              "<li class='list-group-item'> <img src='http://s1.iconbird.com/ico/2013/9/430/w128h1281378622430catpaper.png' height='150' width='150' alt='тут фотка коровы'></li></ul></center>"]]
    when /push/
      if @@pet.exit_
        [404, {"Content-Type" => "text/html"}, ["<a href='/index' >Вырастить нового питомца </a>",
                                                "<img src='http://s1.iconbird.com/ico/2013/9/430/w128h1281378622441catpirate.png' height='150' width='150' alt='тут фотка коровы'>","<br>",
                                                "<br><b>", @@pet.message, "<br><b>"]]
      else
        @@pet.push
        [200, {"Content-Type" => "text/html"}, [links, "<center><ul class='list-group'>",
                                                "<li class='list-group-item'> Спати: #{@@pet.sleep}</li>",
                                                "<li class='list-group-item'> Ситність: #{@@pet.stuff_in_belly}</li>",
                                                "<li class='list-group-item'> Туалет: #{@@pet.toilet}</li>",
                                                "<li class='list-group-item'> Щастя: #{@@pet.mood}</li>",
                                                "<li class='list-group-item'> <img src='http://s1.iconbird.com/ico/2013/8/428/w128h1281377930213catbox2.png' height='150' width='150' alt='тут фотка коровы'></li></ul></center>"]]
      end

    else
      @@pet.message = "#{@@pet.name} не понимает что вы от неё хотите"
      [404, {"Content-Type" => "text/html"}, [links, "<center><ul class='list-group'>",
                                              "<li class='list-group-item'> Спати: #{@@pet.sleep}</li>",
                                              "<li class='list-group-item'> Ситність: #{@@pet.stuff_in_belly}</li>",
                                              "<li class='list-group-item'> Туалет: #{@@pet.toilet}</li>",
                                              "<li class='list-group-item'> Щастя: #{@@pet.mood}</li>",
                                              "<li class='list-group-item'> <img src='http://s1.iconbird.com/ico/2013/8/428/w128h1281377930250cathiss2.png' height='150' width='150' alt='тут фотка коровы'></li></ul></center>"]]
    end
  end
end