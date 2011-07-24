# DSL implementation of Blacklist
class Blacklist
  def initialize(dict, &block)
    @dict = dict
    instance_eval(&block)
  end

  private_class_method :new

  class << self
    def apply_to(dict, &block)
      new(dict, &block)
    end
  end

  def activate(file_list)
    list_excluded = File.open(File.join(path_prj, 'data', 'Blacklist', file_list), "r:utf-8").inject([]) do |chars, line|
      chars << line.chomp
    end
    list_excluded.uniq!
    @dict.affect_by(list_excluded)
  end
end