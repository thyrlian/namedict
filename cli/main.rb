require_relative "../lib/namedict"

path_prj = File.expand_path( File.join( File.dirname(__FILE__), ".." ) )
file_chinese_character_list = File.join( path_prj, "data", "Modern Chinese Character Frequency List" )
file_ps = File.join( path_prj, "data", "dict.dat" )
dict = Dict.new(file_chinese_character_list, file_ps)
puts dict.chars.size

Blacklist.apply_to dict do

  activate "feminine"
  activate "surname"
  activate "seniority"
  activate "other"
  activate "derogatory"
  activate "unusual"

end

puts dict.chars.size
puts dict.chars.first.inspect
puts dict.chars.last.inspect
