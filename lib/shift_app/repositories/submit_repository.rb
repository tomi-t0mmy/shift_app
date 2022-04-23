class SubmitRepository < Hanami::Repository

    def find_by_user_id(id)
        submits.where(user_id: id).call.collection
    end
end
