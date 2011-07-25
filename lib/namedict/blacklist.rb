# DSL implementation of Blacklist
class Blacklist
  attr_accessor :dict, :list

  def initialize(dict, &block)
    @dict = dict
    @list = []
    instance_eval(&block)
    @list.uniq!
    sweep unless @list.size == 0
  end

  class << self
    def apply_to(dict, &block)
      new(dict, &block)
    end
  end

  def activate(file_list)
    list_excluded = File.open(File.join(path_prj, 'data', 'Blacklist', file_list), "r:utf-8").inject([]) do |chars, line|
      chars << line.chomp
    end
    @list.concat(list_excluded)
    # @dict.affect_by(list_excluded)
  end
  
  def sweep
    # for each in @list, kick out from @dict
    # create hash to speed up processing
  end
  
  private_class_method :new
  private :sweep
end
