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
    dict.chars.replace(@dict)
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
    @pronunciation.merge!(pronounceable)
  end
  
  def validate
    @dict.chars.each do |char|
      char.py.each do |x|
        break(true) if @pronunciation[x.gsub(/\d+/, "")]
      end
    end
  end
  
  private_class_method :new
  private :validate
end
