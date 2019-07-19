require 'tty-prompt'
require 'tty-tree'

prompt = TTY::Prompt.new

# prompt.ask('What is your name?', default: ENV['USER'])
# prompt.yes?('Do you like Ruby?')
# prompt.mask("What is your secret?")

# prompt.select('Choose your destiny?', %w[Scorpion Kano Jax])

# choices = %w(vodka beer wine whisky bourbon)
# prompt.multi_select("Select drinks?", choices)

# choices = %w(emacs nano vim)
# prompt.enum_select("Select an editor?", choices)

# result = prompt.collect do
#   key(:name).ask('Name?')

#   key(:age).ask('Age?', convert: :int)

#   key(:address) do
#     key(:street).ask('Street?', required: true)
#     key(:city).ask('City?')
#     key(:zip).ask('Zip?', validate: /\A\d{3}\Z/)
#   end
# end

# result = prompt.ask("What is your name?") do |q|
#   q.required true
#   q.modify   :capitalize
# end

# r = prompt.ask('Ingredients? (comma sep list)') do |q|
#   q.convert -> (input) { input.split(/,\s*/) }
# end

# result = prompt.ask("What is the host address?", default: 'localhost') do |q|
#   q.required true
# end

# p result

# tree = TTY::Tree.new do
#   node 'dir1' do
#     node 'config.dat'
#     node 'dir2' do
#       node 'dir3' do
#         leaf 'file3-1.txt'
#       end
#       leaf 'file2-1.txt'
#     end
#     node 'file1-1.txt'
#     leaf 'file1-2.txt'
#   end
# end

# p tree.render
