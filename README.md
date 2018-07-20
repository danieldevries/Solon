# Solon

Simple authorization through objects.

Still in alpha.

## Installation

Add this to your application's `shard.yml`:

```yaml
dependencies:
  solon:
    github: danieldevries/solon
```

## Usage

```crystal
require "solon"

class PostPolicy < Solon::Policy
  register User, Post

  def update?
    @user.admin? || !@record.draft?
  end

  def destroy?
    @user.admin?
  end
end

# returns post if successful or raises exception if not
Solon.authorize(user, post, "update?")
```

## Development

TODO: Write development instructions here

## Contributing

1. Fork it (<https://github.com/danieldevries/solon/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [danieldevries](https://github.com/danieldevries) Daniël de Vries - creator, maintainer
