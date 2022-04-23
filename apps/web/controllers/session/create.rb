module Web
  module Controllers
    module Session
      class Create
        include Web::Action

        def call(params)
          user = UserRepository.new.find_by_email(params[:session][:email])
          if user != nil
            session[:id] = user.id

            redirect_to '/user'
          else
            self.status = 401
          end   
        end
      end
    end
  end
end
