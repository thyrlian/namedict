# PATH_NOW = Dir.pwd.gsub(/\//,'\\').concat('\\') # for Windows OS
require 'bigdecimal'

def extract_characters(file_dict)
  regex_cols = /^(\d+)\s+(.+?)\s+(\d+)\s+([0-9\.]+)\s+(.+?)\s+(.*?)$/
  tmp_pc ||= BigDecimal.new('0')

  characters = File.open(file_dict, 'r:utf-8').inject([]) do |list, line|
    # ( md = regex_cols.match(line) ) ? list << {sn: md[1].to_i, ch: md[2], fq: md[3].to_i, pc: md[4].to_f, py: md[5], en: md[6]} : list
    if ( md = regex_cols.match(line) )
      list << {
        sn: md[1].to_i,
        ch: md[2],
        fq: md[3].to_i,
        pc: BigDecimal.new(md[4]) - tmp_pc, # md[4].to_f - tmp_pc,
        py: md[5],
        en: md[6].chomp
      }
      tmp_pc = BigDecimal.new(md[4])
    end
    list
  end

  return characters
end

#PATH_PRJ = File.expand_path( File.join( File.dirname(__FILE__), '..', '..' ) )
#file_chinese_character_list = File.join( PATH_PRJ, 'data', 'Modern Chinese Character Frequency List' )
#chinese_characters = extract_characters(file_chinese_character_list)

#puts chinese_characters.first.inspect
#puts chinese_characters.last.inspect
#puts chinese_characters.inspect
#puts chinese_characters.last[:sn].to_i
#puts chinese_characters.last[:ch]
#puts chinese_characters[0][:pc]
#puts chinese_characters[1][:pc]
#puts chinese_characters[2][:pc]
#puts chinese_characters[3][:pc]
