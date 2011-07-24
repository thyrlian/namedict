#encoding: utf-8
$: << "."
require "test_helper"

class TestString < Test::Unit::TestCase
  def setup
    path_prj = File.expand_path( File.join( File.dirname(__FILE__), ".." ) )
    file_test = File.join( path_prj, "data", "Blacklist", "test" )
    @list = File.open(file_test, "r:utf-8").inject([]) do |chars, line|
      line.rm_comment! ? chars << line : chars
    end
  end

  def test_rm_comment
    assert_equal(["李", "李", "李", "李", "临", "兵", "斗", "者", "皆", "阵", "列", "在", "前"], @list)
  end
end