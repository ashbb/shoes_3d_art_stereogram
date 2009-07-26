# sentence_stereogram.rb

Shoes.app :width => 520, :height => 350, :title => 'Create hidden message!' do
  words = IO.read('sentence.txt').split
  boxes = []
  
  f = lambda do |x, y|
    flow :left => x, :top => y, :width => 150, :height => 300 do
      words.each do |word|
        word += ' '
        bk = nil
        box = flow{bk = background(lightblue).hide; para code(word), :size => 10}
        boxes << box
        box.style :width => word.length * 8, :bk => bk
        box.style :displace_left => 0, :displace_top => 0
        box.click{box.style[:bk].toggle}
      end
    end
  end

  action = lambda do |n|
    boxes.each do |box|
      box.displace(box.style[:displace_left] + n, 0) unless box.style[:bk].style[:hidden]
    end
  end
  
  button('<<'){action[-1]}
  button('>>'){action[1]}
  
  nostroke
  oval 100, 105, 10, :fill => lightblue
  oval 270, 105, 10, :fill => lightblue
  
  f[100, 50]
  f[270, 50]
end