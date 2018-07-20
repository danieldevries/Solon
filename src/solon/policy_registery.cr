module Solon
  class PolicyRegistery
    REGISTRY = [] of Nil

    macro register(name, klass)
      {% REGISTRY << {name, klass} %}
    end

    macro finished
      def self.find(name)
        case name
          {% for thing in REGISTRY %}
            when {{thing[0]}}
              {{thing[1]}}
          {% end %}
        end
      end
    end
  end
end
