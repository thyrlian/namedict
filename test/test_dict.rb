#encoding: utf-8
$: << '.'
require_relative 'test_helper'

class TestCharListParser < Test::Unit::TestCase
  def setup
    path_prj = File.expand_path( File.join( File.dirname(__FILE__), '..' ) )
    file_chinese_character_list = File.join( path_prj, 'data', 'Modern Chinese Character Frequency List' )
    @dict = Dict.new(file_chinese_character_list)
  end

  def test_collection_size
    assert_equal(9933, @dict.collection.size)
  end

  def test_collection_first
    assert_equal("的", @dict.collection.first.ch)
  end

  def test_collection_last
    assert_equal("鴒", @dict.collection.last.ch)
  end
end