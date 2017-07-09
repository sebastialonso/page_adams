# Paginator
ActiveRecord model pagination made easy.

## Usage
Include Paginator in every model you want to paginate
~~~ruby
class Article < ApplicationRecord
  include Paginator
end
~~~

That's it. Now you can call `Article.page 5` to get the fifth page of paginated results.

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'paginator'
```

And then execute:
```bash
$ bundle install
```

Or install it yourself as:
```bash
$ gem install paginator
```

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
