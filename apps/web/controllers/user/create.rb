module Web
  module Controllers
    module User
      class Create
        include Web::Action

        def call(params)
          UserRepository.new.create(params[:user])

          redirect_to '/session'
        end
      end
    end
  end
end
