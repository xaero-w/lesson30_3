class Clothes

  attr_reader :type

  def initialize(title, type, temp)
    @title = title
    @type = type
    @temp = temp
  end

  def to_s
    "#{@title} (#{@type}) #{@temp.join("..")}"
  end

  def check_temp(out_temp)
    (@temp[0]..@temp[1]).include?(out_temp)
  end

end
