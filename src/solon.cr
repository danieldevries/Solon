require "./solon/*"

module Solon
  def self.authorize(user, record, query)
    policy = self.policy(user, record)
    return false unless policy.can?(query)
    record
  end

  def self.policy(user, record)
    klass = Solon::PolicyRegistery.find(record.class.to_s)
    raise UnknownPolicyError.new(user) if klass.nil?
    klass.new(user, record)
  end

  def self.authorize!(user, record, query)
    raise NotAuthorizedError.new(query, record) unless Solon.authorize(user, record, query)
    record
  end

  class NotAuthorizedError < Exception
    def initialize(query, record)
      super("not allowed to #{query} this #{record}")
    end
  end

  class UnknownPolicyError < Exception
    def initialize(policy)
      super("#{policy.class.to_s} not found")
    end
  end
end
