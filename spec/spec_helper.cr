require "spec"
require "../src/solon"

class User
end

class Post
end

class PostPolicy < Solon::Policy
  register User, Post

  def update?
    true
  end

  def destroy?
    false
  end
end

def create_test_objects
  [User.new, Post.new]
end
