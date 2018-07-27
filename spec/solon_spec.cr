require "./spec_helper"

describe Solon do
  describe ".authorize" do
    it "authorizes" do
      user = User.new
      post = Post.new

      Solon.authorize(user, post, "update?").should eq(post)
    end

    it "returns false when not authorized" do
      user = User.new
      post = Post.new

      Solon.authorize(user, post, "destroy?").should eq(false)
    end

    it "raises an exception with unknown method" do
      user = User.new
      post = Post.new

      expect_raises(Solon::Policy::WrongInstanceMethod) do
        Solon.authorize(user, post, "fly?")
      end
    end
  end

  describe ".authorize!" do
    it "raises an exception when not authorized" do
      user = User.new
      post = Post.new

      expect_raises(Solon::NotAuthorizedError) do
        Solon.authorize!(user, post, "destroy?")
      end
    end
  end
end
