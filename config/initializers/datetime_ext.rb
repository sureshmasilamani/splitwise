class Date

  def custom_format
     strftime('%m/%d/%Y')
  end

  def db_format
    strftime("%Y-%m-%d")
  end

  def self.today
    current
  end

end

class DateTime

  def custom_format
    strftime('%m/%d/%Y')
  end

  def db_format
    strftime("%Y-%m-%d %I:%M:%S")
  end


end

class Time

  def custom_format
    strftime('%m/%d/%Y')
  end

  def db_format
    strftime("%Y-%m-%d")
  end


end

class String

  def custom_format
    to_datetime.strftime('%m/%d/%Y') rescue "invalid date"
  end

  def db_format
    Date.strptime(self,"%m/%d/%Y").strftime("%Y-%m-%d")
  end

end

class NilClass

  def custom_format
    self
  end

  def db_format
    self
  end

end