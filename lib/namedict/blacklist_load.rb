class String
  def rm_comment!
    return self.replace( self.chomp.gsub(/#.*/, '').strip )
  end
end

path_prj = File.expand_path( File.join( File.dirname(__FILE__), '..', '..' ) )

blacklist = File.open( File.join(path_prj, 'data', 'Blacklist_test'), 'r:utf-8' ).inject([]) { |list, line| line.rm_comment! == "" ? list : list << line }.uniq

puts blacklist.inspect