# DSL implementation of Blacklist
class Blacklist
  def initialize(dict, &block)
    @dict = dict
    instance_eval(&block)
  end

  class << self
    def apply_to(dict, &block)
      self.new(dict, &block)
    end
  end

  def activate(list)
    parse_list
    @dict.affect_by(list)
  end
end