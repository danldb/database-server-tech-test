#Database Server Tech Test

This is a solution to a mock tech test taken at MA. 

##The Brief
You receive a message from a prospective employer:

"Before your interview, write a program that runs a server that is accessible on http://localhost:4000/. When your server receives a request on http://localhost:4000/set?somekey=somevalue it should store the passed key and value in memory. When it receives a request on http://localhost:4000/get?key=somekey it should return the value stored at somekey.

During your [mock] interview, you will pair on saving the data to a file."

Create a new git repository and write code to fulfill the brief to the best of your ability. Store the data in memory, not in a database, but bear in mind that you will later need to add a database to this code.

##Running the tests (Ruby)
* clone this repo and navigate into the `ruby` directory.
* run `bundle`
* run `bundle exec rspec`

