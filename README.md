# Eidolon
[![Build Status](https://travis-ci.org/sesvxace/eidolon.svg?branch=master)][travis]
[![Coverage Status](https://coveralls.io/repos/sesvxace/eidolon/badge.png?branch=master)][coverage]
[![Gem Version](https://badge.fury.io/rb/eidolon.svg)][gem]
[![Documentation](http://b.repl.ca/v1/yard-docs-blue.png)][yard]

1. _noun: an idealized person or thing._
2. _noun: a phantom._

## Summary
In short, Eidolon provides the minimal scaffolding required to load data from the RPG Maker series into a pure, external Ruby installation independent of the chosen Ruby implementation (MRI, JRuby, or Rubinius) or the user's operating system.

**Note:** Eidolon is only concerned with the _loading_ of RGSSx data -- it is _not_ built for the purposes of external manipulation and serialization of it.

## Usage
The simplest use case for Eidolon is when you already know which version of the RGSS data structures your application will require. If you are only operating with one (whether it be RGSS, RGSS2, or RGSS3), you simply need to require the necessary version:

```ruby
require 'eidolon/rgss'
# -- OR --
require 'eidolon/rgss2'
# -- OR --
require 'eidolon/rgss3'
```

Note that only one version may be required this way: attempting to `require` more than one version of the RGSS data structures will result in superclass mismatches. For this reason, if you potentially need to operate with more than one of the RGSS versions, you should use the core Eidolon module instead; essentially, the usage of this module allows you to dynamically create and destroy the needed RPG data structures whenever they are required. See the included documentation for more detailed information about the usage of the Eidolon module.

```ruby
require 'eidolon'

# Equivalent to the RGSSx +load_data+ method.
def load_data(filename)
  File.open(filename, 'rb') { |data| Marshal.load(data) }
end

# Build the RGSS data structures and return RMXP project data.
Eidolon.build('RGSS') do
  data = []
  Dir.glob('**/*.rxdata') { |rxdata| data << load_data(rxdata) }
  data
end
```

## Local Extensions
Eidolon has been written in a way that allows developers to easily extend or modify the RGSSx data that it loads. This feature was primarily included to allow newer versions of RGSSx to be easily added to Eidolon in case of their release.

Essentially, Eidolon looks through a defined path for specific files to load RGSS data dependent on the RGSS version you request. For RGSS, it looks for `eidolon/rgss/loader.rb`, RGSS2 looks for `eidolon/rgss2/loader.rb`, and so on. In order to create RGSS4, for example, you simply need to recreate this structure locally -- and Eidolon will allow you to use it.

```
$ cat eidolon/rgss4/loader.rb
# Load all of your needed modifications here.
load 'eidolon/rgssx/loader.rb'
load 'eidolon/rgss4/rpg/example.rb'

$ cat rgss4_application.rb
Eidolon.build(:RGSS4) { ... }
```

## Installation
```sh
$ gem install eidolon
```

## Contributing
If you are interested in development, simply fork [the GitHub repository][eidolon], create a new branch, commit the changes, and create a new pull request.

```sh
$ git checkout -b new-branch
$ git commit -am 'Added some feature.'
$ git push origin new-branch
```

Please be sure to _create a new branch_ and _provide tests_ for your work. Contributions that do not meet these requirements will **not** be accepted.

## License
Eidolon is made available under the terms of the MIT Expat license. See the included LICENSE file for more information.

[coverage]: https://coveralls.io/r/sesvxace/eidolon?branch=master
[eidolon]:  https://github.com/sesvxace/eidolon
[gem]:      http://badge.fury.io/rb/eidolon
[travis]:   https://travis-ci.org/sesvxace/eidolon
[yard]:     http://rubydoc.info/gems/eidolon/frames