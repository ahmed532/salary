class AuthenticateStaff
  prepend SimpleCommand

  def initialize(email, password)
    @email = email
    @password = password
  end

  def call
    JsonWebToken.encode(staff_id: staff.id) if staff
  end

  private

  attr_accessor :email, :password

  def user
    staff = Staff.find_by_email(email)
    return staff if staff && staff.authenticate(password)

    errors.add :staff_authentication, 'invalid credentials'
    nil
  end
end

