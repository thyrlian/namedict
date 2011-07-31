#encoding: utf-8
$: << "."
require "test_helper"

class TestChar < Test::Unit::TestCase
  def setup
    path_prj = File.expand_path( File.join( File.dirname(__FILE__), ".." ) )
    file_chinese_character_list = File.join( path_prj, "data", "Modern Chinese Character Frequency List" )
    file_ps = File.join( path_prj, "data", "dict.dat" )
    @char = Char.new(ch: "的", pc: BigDecimal.new("4.09432531783"), py: ["de", "di2", "di4"], tr: "(possessive particle)/of, really and truly, aim/clear")
  end
  
  def test_ch
    assert_equal("的", @char.ch)
  end
  
  def test_pc
    assert_equal(BigDecimal.new("4.09432531783"), @char.pc)
  end
  
  def test_py
    assert_equal(["de", "di2", "di4"], @char.py)
  end
  
  def test_tr
    assert_equal("(possessive particle)/of, really and truly, aim/clear", @char.tr)
  end
end
