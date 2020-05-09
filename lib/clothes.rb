class Clothes
  def initialize(title, type, temp)
    @title = title
    @type = type
    @temp = temp
  end

  def to_s
    puts "#{@title} (#{@type}) #{@temp.join("..")}"
  end

  def check_temp(out_temp)
    if out_temp >= @temp[0] && out_temp <= @temp[1]
      return 1
    else
      return 0
    end
  end

  def get_type
    @type
  end
end
