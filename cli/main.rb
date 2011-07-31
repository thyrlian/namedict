require_relative "../lib/namedict"

path_prj = File.expand_path( File.join( File.dirname(__FILE__), ".." ) )
file_chinese_character_list = File.join( path_prj, "data", "Modern Chinese Character Frequency List" )
file_ps = File.join( path_prj, "data", "dict.dat" )
file_names = File.join( path_prj, "Names" )
dict = Dict.new(file_chinese_character_list, file_ps)

Blacklist.apply_to dict do
  activate "feminine"
  activate "surname"
  activate "seniority"
  activate "other"
  activate "derogatory"
  activate "unusual"
end

Pronounceability.affect dict do
  follow "English"
end

puts "### Total number of characters: #{dict.chars.size}"
dict.generate_names(file_names) # file generated will be larger than 600MB
puts "### Finished!!!  Total number of names: #{dict.chars.size * dict.chars.size}"
