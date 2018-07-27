module Solon
  module Helpers
    def authorize(user, record, query)
      Solon.authorize(user, record, query)
    end

    def authorize!(user, record, query)
      Solon.authorize!(user, record, query)
    end
  end
end
