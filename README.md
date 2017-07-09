[![Gem Version](https://badge.fury.io/rb/page_adams.svg)](https://badge.fury.io/rb/page_adams)

# PageAdams
ActiveRecord model pagination made easy.

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

## Usage
Include PageAdams in every model you want to paginate
~~~ruby
class Article < ApplicationRecord
  include PageAdams
end
~~~

That's it. Now you can call `Article.page 5` to get the fifth page of paginated results.

`page` returns a hash with the following structure:
~~~ruby
> Article.page 1
=> {:records=>#<ActiveRecord::Relation [#<Article id: 1>]>, :current_page=>1, :total_pages=>4}
~~~

in wich
* the `:records` key holds an array of instances (or empty) (`ActiveRecord::Relation`)
* the `:current_page` key holds the current retrieved page (`Integer`)
* the `:total_pages` key holds the total number of instances pages (`Integer`)


You can also specify the page size per method call
~~~ruby
> pagination = Article.page(1, 7)
> pagination[:records].size
=> 7
~~~

## Configuration
At the moment, only `page_size` can be configured. Create 'config/initializers/page_adams.rb' and write
~~~ruby
PageAdams.setup do |config|
  config.page_size = 7
end
~~~

## Tests
A basic suite of tests has been included into the gem, using RSpec. 
Clone the project, enter the folder and run `rspec`.

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
