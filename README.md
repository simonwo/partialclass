# Partial Classes

This gem allows you to specify arguments to a class before you
actually initialize it. This is useful for two main reasons:

1. It means you can specify initializer arguments ahead of time,
   cutting down on the number of variables you need to pass around
   or wrapper classes you need to manually write.
2. You can write a base class that takes initializer arguments
   and then generate more specific child classes by specifying the
   required arguments.

This is particularly useful if your class performs some some kind
of memory- or resource-hungry action in its initializer that you 
want to save until later (e.g. `File.new` opens the file straight 
away).

The key point about all this is that you still get to pass around
classes, not `Proc`s or anything else, so you will still get the 
behaviour that you expect a class to have. See the Usage
section for more information.

If the idea of this confuses or disorientates you, stop usage
immedieatly and seek medial assistance.

## Installation

Add this line to your application's Gemfile:

    gem 'partialclass'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install partialclass

## Usage

	require 'partialclass'

You can use `specialize` to generate a specialized child class:

	Logfile = File.specialize "mylog.txt"   # No files open yet
	...
	f = Logfile.new 'w'                     # File opened here!

You can also use the `<<` operator to push arguments to the class:

	SpecificDay = Time << 2009 << 10 << 25
	puts SpecificDay.new           # 2009-10-25 00:00:00 +0100
	puts SpecificDay.new 22, 35    # 2009-10-25 22:35:00 +0100

You can also specialize classes multiple times:

	SpecificMinute = SpecificDay << 22 << 35
	puts SpecificMinute.new 06     # 2009-10-25 22:35:06 +0100

Specialized classes are child classes of the original:

	SpecificDay.superclass         # Time

In many cases there maybe another way of acheiving this effect. If
you don't like this way, then don't use it!

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
