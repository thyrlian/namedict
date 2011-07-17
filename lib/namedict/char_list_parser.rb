# PATH_NOW = Dir.pwd.gsub(/\//,'\\').concat('\\') # for Windows OS
require "bigdecimal"
require "pstore"

def parse_characters(file_dict)
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
        py: md[5].split("/"),
        tr: md[6].chomp
      }
      tmp_pc = BigDecimal.new(md[4])
    end
    list
  end

  return characters
end

def save2disk(ary_chars, saved_file)
  db = PStore.new(saved_file)
  db.transaction do
    ary_chars.each do |char|
      db["character"] = char
    end
  end
end