require "bigdecimal"
require "pstore"
require "json"
require_relative "namedict/blacklist"
require_relative "namedict/char"
require_relative "namedict/dict"
require_relative "namedict/name"
require_relative "namedict/string"

path_prj = File.expand_path( File.join( File.dirname(__FILE__), ".." ) )
file_chinese_character_list = File.join( path_prj, "data", "Modern Chinese Character Frequency List" )
file_ps = File.join( path_prj, "data", "dict.dat" )
dict = Dict.new(file_chinese_character_list, file_ps)
# puts dict.chars.size
# puts dict.chars[0].inspect


Blacklist.apply_to dict do

  activate "feminine"
  activate "surname"
  activate "seniority"
  activate "other"
  activate "derogatory"
  activate "unusual"

end
