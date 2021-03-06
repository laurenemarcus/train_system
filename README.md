INTRODUCTION
------------
The Train System app allows the train system operator to add stations and line and the rider to view a train line and train stations.

This app demonstrates usage of Ruby, BDD, RSpec, Sinatra, and PostgreSQL with a focus on writing update and delete methods as well as integrating that functionality into Sinatra files,  gaining more practice with using databases, and using instances of one object inside another.

REQUIREMENTS
------------
Ruby v 2.2.0

postgreSQL 9.4.0


INSTALLATION
------------
Run the following command to install pg:

`gem install pg`

Run the following command to start the postgreSQL server:

`postgres`

Run the following command to access psql:

`psql`

Run the following commands in `psql` to create the databases:

`CREATE DATABASE train_system;`

`\c train_system`

`CREATE TABLE lines (id serial PRIMARY KEY, line_name varchar);`

`CREATE TABLE stations (id serial PRIMARY KEY, station_name varchar, station_location varchar);`

`CREATE DATABASE train_system_test WITH TEMPLATE train_system;`

Run the following command to install bundler:

`gem install bundle`

Run the following command to install all required gems:

`bundle`

Run the following command to install RSpec:

`gem install rspec`

Run the following command to start the Sinatra server:

`$ ruby app.rb`

Go to the following site in Chrome to launch the app:

`localhost:4567`


KNOWN BUGS
---------
No known bugs at this time.


AUTHORS
-------
Lauren Marcus
lauren.e.marcus@gmail.com

Crystal Contreras-Grossman


LICENSE
-------

Copyright (c) 2015 Lauren Marcus & Crystal Contreras-Grossman

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
