# wallpaper_stereogram.rb
Shoes.app :width => 500, :height => 300, :title => 'Wallpaper Stereogram' do
  dots = Array.new(12){[rand(55), rand(20)]}
  rects = []
  @flag = false
  w, h = 60, 30
  
  button 'new'do
    7.times do |j|
      7.times do |i|
        box = flow :left => 30 + (w + 5) * i, :top => 30 + (h + 5) * j, :width => w, :height => h do
          rects << rect(0, 0, w - 1, h - 1, :fill => rgb(176, 224, 230, 0.3))
          image :width => w, :height => h do
            dots.each{|x, y| oval x, y, 5}
          end
        end

        box.click{@flag = true; @box = box}
        box.release{@flag = false}
        motion{|left, top| @box.move(left - w / 2, top - h / 2) if @flag}
      end
    end
  end
  
  button 'off/on' do
    rects.each{|r| r.toggle}
  end
end