class String
  def rm_comment!
    # return self.replace( self.chomp.gsub(/#.*/, "").strip )
    str = self.chomp.gsub(/#.*/, "").strip
    str == "" ? nil : self.replace(str)
  end
  
  # Only apply for Pinyin
  # http://en.wikipedia.org/wiki/Number_of_the_Beast
  # http://en.wikipedia.org/wiki/666_(number)
  def is_number_of_the_beast?
    number_of_name = self.downcase.split('').inject(0) do |num, ch|
      num += ch.ord + 3
    end
    number_of_name == 666 ? true : false
  end
end