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

`page` returns a hash of the following structure:
~~~ruby
> Article.page 0
=> {:records=>#<ActiveRecord::Relation [#<Article id: 1>]>, :current_page=>1, :total_pages=>4}
~~~

in wich
* the `:records` key holds an array of instances (or empty) (`ActiveRecord::Relation`)
* the `:current_page` key holds the current retrieved page (`Integer`)
* the `:total_pages` key holds the total number of instances pages (`Integer`)

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

## Tests
A basic suite of tests has been included into the gem, using RSpec. 
Clone the project, enter the folder and run `rspec`.

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
