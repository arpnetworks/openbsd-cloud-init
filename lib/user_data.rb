class UserData
  def initialize(user_data_file)
    @user_data = nil
    @file = user_data_file

    raise InvalidUserData unless File.exist?(@file)

    read! && load!
  end

  def users
    @user_data['users']
  end

  protected

  def read!
    @user_data = File.read(@file)
  end

  def load!
    @user_data = YAML.load(@user_data)
  end
end
