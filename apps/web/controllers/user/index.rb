module Web
  module Controllers
    module User
      class Index
        include Web::Action
        expose :user
        expose :submits

        def call(params)
          if session[:id] == nil
            redirect_to '/session'
          else
            user = UserRepository.new.find(session[:id])
            @user = user
            submit_repo = SubmitRepository.new
            @submits = submit_repo.find_by_user_id(user.id)

          end
        end
      end
    end
  end
end
