def get_template_option
  template_path = "TEMPLATES_PATH"
  counter = 0
  options = []

  Dir.glob("#{template_path}/*") do |element|
      counter += 1
      option = File.basename(element)
      options << option
      puts "#{counter} => #{option}"
  end

  puts "\nchoose template option number:"
  choosen_template = gets.chomp.to_i

  abort "out of range" if choosen_template > counter or choosen_template <= 0

  options[choosen_template -= 1]
end


def add_template(template_path, out_path, feature_name)

  pattern = 'PATTERN'

  Dir.glob("#{template_path}/*") do |element|
      next if element == '.' or element == '.DS_Store'

      current_element_name = File.basename(element)

      if File.directory?(element)
          out = "#{out_path}/#{current_element_name}"
          Dir.mkdir(out)
          add_template(element, out, feature_name)

      elsif File.file?(element)
          puts current_element_name
          file_name = current_element_name.sub(pattern, feature_name)

          File.open("#{template_path}/#{current_element_name}", "rb") do |e|
              File.open("#{out_path}/#{file_name}", "w") do |f|
                  data = e.read
                  f.write(data.gsub(pattern, feature_name))
              end
          end
      end
  end
end

puts 'enter path:'

choosen_template = get_template_option()

puts 'enter name:'
feature_name = gets.chomp

template_path = "TEMPLATES_PATH#{choosen_template}"
out = "OUTPUT_PATH"

add_template(template_path, out, feature_name)
