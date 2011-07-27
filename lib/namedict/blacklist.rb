# DSL implementation of Blacklist
class Blacklist
  attr_accessor :dict, :list

  def initialize(dict, &block)
    @dict = dict
    @list = []
    @path_prj = File.expand_path( File.join( File.dirname(__FILE__), "..", ".." ) )
    instance_eval(&block)
    @list.uniq!
    sweep unless @list.size == 0
    dict.chars.replace(@dict)
  end

  class << self
    def apply_to(dict, &block)
      new(dict, &block)
    end
  end

  def activate(file_list)
    list_excluded = File.open(File.join(@path_prj, 'data', 'Blacklist', file_list), "r:utf-8").inject([]) do |chars, line|
      line.rm_comment! ? chars << line : chars
    end
    @list.concat(list_excluded)
  end
  
  def sweep
    hsh_dict = @dict.chars.inject({}) do |hsh, char|
      hsh[char.ch] = char
      hsh
    end
    
    @list.each do |black_ch|
      hsh_dict.delete(black_ch) if hsh_dict[black_ch]
    end
    
    @dict = []
    
    hsh_dict.each do |key, value|
      @dict << value
    end
  end
  
  private_class_method :new
  private :sweep
end
