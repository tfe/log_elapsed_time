log_elapsed_time
========

I found myself wanting a quick and easy way to log out how much time certain operations were taking (HTTP requests to external APIs, in my case). Since I found myself doing this in a bunch of places, I decided to extract the code into something reusable, which is what you see here.


Installation
------------

    gem install log_elapsed_time


Usage
-----

Requiring the gem in your project will add a global method named `log_elapsed_time`, which you can use like so:

    log_elapsed_time("Request to external service took") do
      HTTP.post(...)
    end

This would write `Request to external service took 2048ms` to `Rails.logger.info` and return the result of the POST. If you needed to do something with the result, you could keep the return value:

    response = log_elapsed_time do
      HTTP.get(...)
    end

There is one slight gotcha: variables set in the block aren't accessible outside of it, so the following would not work.

    log_elapsed_time do
      response = HTTP.get(...)
    end

If you tried to use `response` later, it wouldn't be defined.


Todo
----

* Don't depend directly on `Rails.logger`, or allow a way to customize the logger.
* Flesh out the pending specs.

Contributing
------------

* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet.
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it.
* Fork the project.
* Start a feature/bugfix branch.
* Commit and push until you are happy with your contribution.
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.


Contact
-------

Problems, comments, and pull requests all welcome. [Find me on GitHub.](http://github.com/tfe/)


Copyright
---------

Copyright © 2014 [Todd Eichel](http://toddeichel.com/). See LICENSE.txt for further details.
