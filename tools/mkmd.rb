# mkmd.rb

PATH = 'http://github.com/ashbb/shoes_3d_art_stereogram/tree/master'

# Import source code ../src/***.rb and create links to ../img/***.png (or.jpg)
def read_src name
  IO.readlines('../src/' + name).collect{|c| "\t" + c}
end

def make_link name
  lines = []
  lines << "**#{name}**"
  lines << "\n"
  lines << "![#{name}](#{PATH.sub('/tree/', '/raw/')}/img/#{name})"
end

file = '../README.md'
lines = IO.readlines(file)
open(file, 'w') do |f|
  lines.each do |line|
    new_line = line
    line.sub(/^# *(.*\.rb)/){new_line = read_src($1)}
    line.sub(/^# *(.*\.(png|jpg))/){new_line = make_link($1)}
    f.puts new_line
  end
end
