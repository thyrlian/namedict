class Pronounceability < Customization
  def set_dir_name
    @dir_name = "Pronounceability"
  end
  
  def activate(file)
    super
    # initialize @list if it's blank, otherwise assign a value with the intersection of itself and current working language file
    if @list.size == 0
      @list = @list_loaded
    else
      @list.select! { |k| @list[k] == @list_loaded[k] }
    end
  end
  
  def validate
    @chars.select! do |char|
      char.py.each{|x| break(true) if @list[x.gsub(/\d+/, "")]}.class == TrueClass ? true : false
    end
  end
end
