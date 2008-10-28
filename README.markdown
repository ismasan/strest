== DESCRIPTION:

ORM-like utilities to interface with non-standard, hybrid REST / RPC type HTTP APIs

== FEATURES/PROBLEMS:

This project is in progress and not functional at all.

== SYNOPSIS:

# Create a class
#
class User
	include Strest::Client
	
	# define the host
	site = 'https://api.cool-service.com'
	
	# use this class to map the response back to Ruby objects
	map_with SomeDataToUsersMapper
	
	# define class methods mapped to HTTP verbs and custom URLs
	#
	get :all, '/weirdUsersPath/users'
	
	# define method with custom mapper
	#
	get :find, '/somePath/userExcerpts', :map_with => CustomResponseMapper
end

# Use it
#
@users = User.all

@user = User.find(3)

== LICENSE:

(The MIT License)

Copyright (c) 2008 Ismael Celis (http://www.estadobeta.com)

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
