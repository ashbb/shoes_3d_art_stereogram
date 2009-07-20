# lattice_stereogram.rb
Shoes.app :width => 540, :height => 270, :title => 'Lattice Stereogram' do
  background rgb(176, 224, 230, 0.3)
  inscription IO.read('lattice.txt'), :font => "MS UI Gothic", 
    :left => 30, :top => 30
end
