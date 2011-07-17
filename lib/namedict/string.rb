class String
  def rm_comment!
    return self.replace( self.chomp.gsub(/#.*/, "").strip )
  end
end