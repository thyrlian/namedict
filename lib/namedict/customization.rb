# DSL implementation, should be inherited by subclass
# Destroy method of new!  Passed parameter dict will be changed by reference
class Customization
  attr_accessor :chars, :list

  def initialize(dict, &block)
    @chars = dict.chars
    @list = {}
    @path_prj = File.expand_path( File.join( File.dirname(__FILE__), "..", ".." ) )
    set_dir_name
    instance_eval(&block)
    unless @list.size == 0
      validate
      dict.chars.replace(@chars)
    end
  end
  
  class << self
    def apply_to(dict, &block)
      new(dict, &block)
    end
  end
  
  # Needs to be overridden by subclass
  def set_dir_name
    @dir_name = ""
  end
  
  # Only has implemented getting list_loaded, needs post action for setting @list
  def activate(file)
    @list_loaded = File.open(File.join(@path_prj, 'data', @dir_name, file), "r:utf-8").inject({}) do |hsh, line|
      hsh[line] = true if line.rm_comment!
      hsh
    end
  end
  
  # Abstract method, needs to be implemented by subclass
  def validate
    raise NotImplementedError, "Abstract method is called, needs to be implemented."
  end
  
  private_class_method :new
  private :validate
end
