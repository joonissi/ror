class NumberValidator < ActiveModel::Validator
  def validate(record)
    #puts
    #puts record.password
    #puts
    #record = record.password.each_char.to_a
    #puts record
    #puts record
    #unless record.password.chars.upcase
    if !record.password.match(/[0-9]/)
      record.errors[:password] << 'Password must have number!'
    end
    # if record.density > 20
    #   record.errors.add(:density, “is too high to safely ship”)
    # end
  end
end