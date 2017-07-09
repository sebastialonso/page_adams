# PageAdams
ActiveRecord model pagination made easy.

## Usage
Include PageAdams in every model you want to paginate
~~~ruby
class Article < ApplicationRecord
  include PageAdams
end
~~~

That's it. Now you can call `Article.page 5` to get the fifth page of paginated results.

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'page_adams'
```

And then execute:
```bash
$ bundle install
```

Or install it yourself as:
```bash
$ gem install page_adams
```

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
