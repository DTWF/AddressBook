class Contact
  attr_accessor :first_name, :last_name, :email

  def initialize(first_name, last_name, email)
    @first_name=first_name
    @last_name=last_name
    @email=email
  end

  def to_s
    "First name: #{first_name}, Last name: #{last_name}, Email: #{email}"
  end
end


