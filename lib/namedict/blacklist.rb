class Blacklist < Customization
  def set_dir_name
    @dir_name = "Blacklist"
  end
  
  def activate(file)
    super
    @list_loaded.each_key { |k| @list[k] = @list_loaded[k] }
  end
  
  def validate
    @chars.select! do |char|
      @list[char.ch] ? false : true
    end
  end
end
