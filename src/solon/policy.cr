module Solon
  class Policy
    class WrongInstanceMethod < Exception
      def initialize(klass, method)
        super("Instance of '#{klass}' class has no '#{method}' method")
      end
    end

    macro create_send
      case method
        {% methods = @type.methods %}
        {% for m in methods %}
        {% if m.args.empty? %}
      when "{{m.name.id}}"
        {{m.name.id}}{% end %}{% end %}
      else
        raise WrongInstanceMethod.new({{@type.name.stringify}}, "#{method}")
      end
    end

    macro register(user, record)
      @user : {{user}}
      @record : {{record}}

      Solon::PolicyRegistery.register("#{{{record}}}", {{record.id}}Policy)

      def initialize(user, record)
        @user = user
        @record = record
      end
    end

    def can?(method)
      create_send
    end
  end
end
