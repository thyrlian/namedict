#encoding: utf-8
$: << "."
require "test_helper"

class TestBlacklist < Test::Unit::TestCase
  def setup
    path_prj = File.expand_path( File.join( File.dirname(__FILE__), ".." ) )
    chars = [Char.new(ch: "物", pc: BigDecimal.new("0.02"), py: ["wu4"], tr: "Object"), 
             Char.new(ch: "十", pc: BigDecimal.new("0.08"), py: ["shi2"], tr: "Ten"), 
             Char.new(ch: "在", pc: BigDecimal.new("0.13"), py: ["zai4"], tr: "At"), 
             Char.new(ch: "兵", pc: BigDecimal.new("0.12"), py: ["bing1"], tr: "Soldier"), 
             Char.new(ch: "太", pc: BigDecimal.new("0.01"), py: ["tai4"], tr: "Very much"), 
             Char.new(ch: "李", pc: BigDecimal.new("0.51"), py: ["li3"], tr: "Surname")]
    dict = stub(:chars => chars)
    @blacklist = Blacklist.apply_to(dict) {activate "nil"}
  end
  
  def test_activate
    
  end
  
  def test_sweep
    
  end
end
