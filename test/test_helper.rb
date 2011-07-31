$LOAD_PATH << "."
$LOAD_PATH.unshift(File.join( File.dirname(__FILE__), "..", "lib" ))

require "test/unit"
require "rubygems"
require "bigdecimal"
require "pstore"
require "json"
require "namedict"
