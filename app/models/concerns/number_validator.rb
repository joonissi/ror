class NumberValidator < ActiveModel::Validator
  def validate(record)
    if !record.password.match(/[0-9]/)
      record.errors[:password] << 'Password must have number!'
    end
  end
end