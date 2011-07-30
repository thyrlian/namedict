# DSL implementation of Pronounceability
# Destroy method of new!  Passed parameter dict will be changed by reference
class Pronounceability
  attr_accessor :dict, :pronunciation
  
  def initialize(dict, &block)
    @dict = dict
    @pronunciation = {}
    @path_prj = File.expand_path( File.join( File.dirname(__FILE__), "..", ".." ) )
    instance_eval(&block)
    validate unless @pronunciation.size == 0
    dict.chars.replace(@dict.chars)
  end
  
  class << self
    def affect(dict, &block)
      new(dict, &block)
    end
  end
  
  def follow(file_lang)
    pronounceable = File.open(File.join(@path_prj, 'data', 'Pronounceability', file_lang), "r:utf-8").inject({}) do |hsh, line|
      hsh[line] = true if line.rm_comment!
      hsh
    end
    # initialize @pronunciation if it's blank, otherwise assign a value with the intersection of itself and current working language file
    if @pronunciation.size == 0
      @pronunciation = pronounceable
    else
      @pronunciation.select! { |k| @pronunciation[k] == pronounceable[k] }
    end
  end
  
  def validate
    @dict.chars.select! do |char|
      char.py.each{|x| break(true) if @pronunciation[x.gsub(/\d+/, "")]}.class == TrueClass ? true : false
    end
  end
  
  private_class_method :new
  private :validate
end
