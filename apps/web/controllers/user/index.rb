module Web
  module Controllers
    module User
      class Index
        include Web::Action
        expose :user_name

        def call(params)
          if session[:id] == nil
            redirect_to '/session'
          else
            user = UserRepository.new.find(session[:id])
            @user_name = user.last_name
          end
        end
      end
    end
  end
end
