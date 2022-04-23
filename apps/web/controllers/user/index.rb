module Web
  module Controllers
    module User
      class Index
        include Web::Action
        expose :user

        def call(params)
          if session[:id] == nil
            redirect_to '/session'
          else
            user = UserRepository.new.find(session[:id])
            @user = user
          end
        end
      end
    end
  end
end
