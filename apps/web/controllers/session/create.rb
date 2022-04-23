module Web
  module Controllers
    module Session
      class Create
        include Web::Action

        def call(params)
          user = UserRepository.new.find_by_email(params[:user][:email])
          if user.present?
            session[:email] = user.email
            session[:password] = user.password

            redirect_to '/user'
          else
            self.status = 401
          end   
         end
        end
      end
    end
  end
end
