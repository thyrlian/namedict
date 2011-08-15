class Customization
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

  private_class_method :new
end
