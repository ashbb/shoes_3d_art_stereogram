3D Art Stereogram on Shoes
==========================

- [3-D art](http://www2.aimnet.ne.jp/nakahara/3dart/3art.html) (Japanese)
- [3-D art](http://www.excite-webtl.jp/world/english/web/?wb_url=http%3A%2F%2Fwww2.aimnet.ne.jp%2Fnakahara%2F3dart%2F3art.html&wb_lp=JAEN&wb_dis=2&wb_co=excitejapan) (English)]

The world of 3D is a mysterious place. :)

Look at the following stereograms created with Shoes!

Lattice Stereogram
------------------

**lattice-stereogram.png**

![lattice-stereogram.png](http://github.com/ashbb/shoes_3d_art_stereogram/raw/master/img/lattice-stereogram.png)

Can you see a letter `E` ?

**Note:** This snapshot was created with ms-paint on Windows XP. It's a bit twisted. So, please run `lattice_stereogram.rb` with Shoes and look at the stereogram on Shoes window.


	# lattice_stereogram.rb
	Shoes.app :width => 540, :height => 270, :title => 'Lattice Stereogram' do
	  background rgb(176, 224, 230, 0.3)
	  inscription IO.read('lattice.txt'), :font => "MS UI Gothic", 
	    :left => 30, :top => 30
	end



Wallpaper Stereogram
--------------------

**wallpaper-stereogram-0.png**

![wallpaper-stereogram-0.png](http://github.com/ashbb/shoes_3d_art_stereogram/raw/master/img/wallpaper-stereogram-0.png)

Click `new` button. 49 small blue rectangles with 12 random dots will be displayed.

**wallpaper-stereogram-1.png**

![wallpaper-stereogram-1.png](http://github.com/ashbb/shoes_3d_art_stereogram/raw/master/img/wallpaper-stereogram-1.png)

You can move one at a time with mouse.

**wallpaper-stereogram-2.png**

![wallpaper-stereogram-2.png](http://github.com/ashbb/shoes_3d_art_stereogram/raw/master/img/wallpaper-stereogram-2.png)

This is my first original stereogram. The second-top and second-bottom lines are looked like depressed. And there are three dents in the middle.

**wallpaper-stereogram-3.png**

![wallpaper-stereogram-3.png](http://github.com/ashbb/shoes_3d_art_stereogram/raw/master/img/wallpaper-stereogram-3.png)

This is my second shot. After moving some rectangles just a little bit distance, we can see 6 rectangles up and 5 down. Amazing!

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
