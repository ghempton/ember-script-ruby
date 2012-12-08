# EmberScript-Ruby

Provides a lightweight ruby wrapper around [EmberScript](https://github.com/ghempton/ember-script).

`EmberScript.compile(source)`

## Installation

This gem requires that an `ember-script` command be available in the current path. Being as EmberScript is still in early development, it is best to install via npm from source. After installing [Node.js](http://nodejs.org/), run the following commands:

```
git clone git@github.com:ghempton/ember-script.git
cd ember-script
npm install
make
sudo npm install -g .
```

## Rails Integration

After following the installation instructions above, simply add the following to your gemfile:

```
gem 'ember_script-rails'
```

## Plain Ruby

```
gem 'ember_script'
```

## Contributing to EmberScript-Ruby
 
* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet.
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it.
* Fork the project.
* Start a feature/bugfix branch.
* Commit and push until you are happy with your contribution.
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

## Copyright

Copyright (c) 2012 Gordon L. Hempton. See LICENSE.txt for
further details.

