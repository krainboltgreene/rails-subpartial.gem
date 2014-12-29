rails-subpartial
--------

  - [![Quality](http://img.shields.io/codeclimate/github/krainboltgreene/rails-subpartial.gem.svg?style=flat-square)](https://codeclimate.com/github/krainboltgreene/rails-subpartial.gem)
  - [![Coverage](http://img.shields.io/codeclimate/coverage/github/krainboltgreene/rails-subpartial.gem.svg?style=flat-square)](https://codeclimate.com/github/krainboltgreene/rails-subpartial.gem)
  - [![Build](http://img.shields.io/travis-ci/krainboltgreene/rails-subpartial.gem.svg?style=flat-square)](https://travis-ci.org/krainboltgreene/rails-subpartial.gem)
  - [![Dependencies](http://img.shields.io/gemnasium/krainboltgreene/rails-subpartial.gem.svg?style=flat-square)](https://gemnasium.com/krainboltgreene/rails-subpartial.gem)
  - [![Downloads](http://img.shields.io/gem/dtv/rails-subpartial.svg?style=flat-square)](https://rubygems.org/gems/rails-subpartial)
  - [![Tags](http://img.shields.io/github/tag/krainboltgreene/rails-subpartial.gem.svg?style=flat-square)](http://github.com/krainboltgreene/rails-subpartial.gem/tags)
  - [![Releases](http://img.shields.io/github/release/krainboltgreene/rails-subpartial.gem.svg?style=flat-square)](http://github.com/krainboltgreene/rails-subpartial.gem/releases)
  - [![Issues](http://img.shields.io/github/issues/krainboltgreene/rails-subpartial.gem.svg?style=flat-square)](http://github.com/krainboltgreene/rails-subpartial.gem/issues)
  - [![License](http://img.shields.io/badge/license-MIT-brightgreen.svg?style=flat-square)](http://opensource.org/licenses/MIT)
  - [![Version](http://img.shields.io/gem/v/rails-subpartial.svg?style=flat-square)](https://rubygems.org/gems/rails-subpartial)


Lets say you have this view:

``` erb
# app/views/posts/index.html.erb

<ol class="posts">
  <% @posts.each do |post| %>
    <li class="post" id="post_<%= post.id %>">
      <header>
        <%= post.title %>
      </header>

      <summary>
        <%= post.summary %>
      </summary>
    </li>
  <% end %>
</ol>
```

You might want to simplify it thusly:

``` erb
# app/views/posts/index.html.erb

<ol class="posts">
  <%= render partial: "post", collection: @posts %>
</ol>
```

``` erb
<li class="post" id="post_<%= post.id %>">
  <header>
    <%= post.title %>
  </header>

  <summary>
    <%= post.summary %>
  </summary>
</li>
```

Rails will look for the partial in these places (in this order):

  - `app/views/posts/_post.html.erb`
  - `app/views/application/_post.html.erb`
  - `app/views/layouts/_post.html.erb`

This is fine until you need to use `_post.html.erb` for a partial in a different context, with different markup.

You have two choices:

  1. Rename the file to `_index_post.html.erb` or similar.
  2. Stop using partials.

So this cool dude made a pull request to rails to allow this lookup behavior:

  - If `<%= render "/comments/show" %>` is called from `app/views/posts.html.erb`
    - It will look for `app/views/comments/show.html.erb` or
    - it will exception is raised
  - If `<%= render "comments/show" %>` is called from `app/views/posts.html.erb`
    - It will look for `app/views/posts/comments/show.erb` or
    - for `app/views/application/comments/show.erb` or
    - it will raise an exception

This allows for this kind of system:

``` erb
# app/views/posts/index.html.erb

<ol class="posts">
  <%= render "index/post", collection: @posts %>
</ol>
```

``` erb
# app/views/posts/index/posts.html.erb

<li class="post" id="post_<%= post.id %>">
  <header>
    <%= post.title %>
  </header>

  <summary>
    <%= post.summary %>
  </summary>
</li>
```

The pull request was silenced eventually and seems to be planned for 5.0.0, so I decided to just go ahead and turn it into a monkey-patch gem.


Using
=====

Just require this gem after rails and learn the information above.


Installing
==========

Add this line to your application's Gemfile:

    gem "rails-subpartial", "~> 1.0"

And then execute:

    $ bundle

Or install it yourself with:

    $ gem install rails-subpartial


Contributing
============

  1. Fork it
  2. Create your feature branch (`git checkout -b my-new-feature`)
  3. Commit your changes (`git commit -am 'Add some feature'`)
  4. Push to the branch (`git push origin my-new-feature`)
  5. Create new Pull Request


Changelog
=========

  - 1.0.0: Initial release


Conduct
=======

As contributors and maintainers of this project, we pledge to respect all people who contribute through reporting issues, posting feature requests, updating documentation, submitting pull requests or patches, and other activities.

We are committed to making participation in this project a harassment-free experience for everyone, regardless of level of experience, gender, gender identity and expression, sexual orientation, disability, personal appearance, body size, race, age, or religion.

Examples of unacceptable behavior by participants include the use of sexual language or imagery, derogatory comments or personal attacks, trolling, public or private harassment, insults, or other unprofessional conduct.

Project maintainers have the right and responsibility to remove, edit, or reject comments, commits, code, wiki edits, issues, and other contributions that are not aligned to this Code of Conduct. Project maintainers who do not follow the Code of Conduct may be removed from the project team.

Instances of abusive, harassing, or otherwise unacceptable behavior may be reported by opening an issue or contacting one or more of the project maintainers.

This Code of Conduct is adapted from the [Contributor Covenant](http:contributor-covenant.org), version 1.0.0, available at [http://contributor-covenant.org/version/1/0/0/](http://contributor-covenant.org/version/1/0/0/)


License
=======

Copyright (c) 2014 Kurtis Rainbolt-Greene

MIT License

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
