class UserRepository < Hanami::Repository
    def find_by_email(email)
        users.where(email: email).one
    end
end
