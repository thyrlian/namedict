#encoding: utf-8
$: << "."
require "test_helper"

class TestCharListParser < Test::Unit::TestCase
  def setup
    path_prj = File.expand_path( File.join( File.dirname(__FILE__), '..' ) )
    file_chinese_character_list = File.join( path_prj, 'data', 'Modern Chinese Character Frequency List' )
    @chinese_characters = parse_characters(file_chinese_character_list)
  end

  def test_char_list_size
    assert_equal 9933, @chinese_characters.size
  end

  def test_char_list_first
    assert_equal( {
                   :sn=>1,
                   :ch=>"的",
                   :fq=>7922684,
                   :pc=>BigDecimal.new('4.09432531783'),
                   :py=>["de", "di2", "di4"],
                   :tr=>"(possessive particle)/of, really and truly, aim/clear"
                  }, @chinese_characters.first )
  end

  def test_char_list_last
    assert_equal( {
                   :sn=>9933,
                   :ch=>"鴒",
                   :fq=>1,
                   :pc=>BigDecimal.new('0.0000005168'),
                   :py=>["ling2"],
                   :tr=>""
                  }, @chinese_characters.last )
  end
end
