module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      self.current_user = find_verified_user
    end

    private

    def find_verified_user
      user_id = cookies.encrypted["_suite_fit_session"]["warden.user.user.key"].flatten.first
      if verified_user = User.find(user_id)
        verified_user
      else
        reject_unauthorized_connection
      end
    end
  end
end
