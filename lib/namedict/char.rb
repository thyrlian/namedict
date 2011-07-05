class Char
  attr_accessor :ch, :pc, :py, :tr

  def initialize(parsed_char)
    @ch = parsed_char[:ch]
    @pc = parsed_char[:pc]
    @py = parsed_char[:py]
    @tr = parsed_char[:tr]
  end
end