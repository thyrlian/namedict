class String
  def rm_comment!
    # return self.replace( self.chomp.gsub(/#.*/, "").strip )
    str = self.chomp.gsub(/#.*/, "").strip
    str == "" ? nil : self.replace(str)
  end
end