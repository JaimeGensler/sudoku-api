# Sudoku API (v1)

#### A test run at creating a RAILS API to return Sudoku boards! - Feb. 2, 2020

##### _by Jaime Gensler_


## Description
This Sudoku API (run on local host) is designed to allow you to request a standard 9x9 Sudoku grid. Grids of a specified difficulty can be requested additionally. Grids are supplied as 81 character strings - each 9 characters represents a row. Results are returned as JSON objects, including the board's ID, the solved_grid string (the unique solution of the puzzle), the puzzle_grid string (the initial state of the puzzle), and the puzzle's difficulty (easy, medium, or hard). All routes and options are described below!

* #### GET /api/v1/grids
	* This request will return a list of ALL grids. You can add the difficulty option ( /api/v1/grids?difficulty=easy ) to get grids of differing difficulties. Currently, the only accepted difficulties are "easy," "medium," and "hard."
* #### GET /api/v1/grids/:id
	* By supplying an ID to the route, this request will return the grid that matches the specified ID. _Does not currently take additional options._
* #### GET /api/v1/grids/random
	* This request will randomly return one grid. The difficulty option (api/v1/grids/random?difficulty=easy) can be added to also request a random grid of the specified difficulty.
* #### POST /api/v1/grids
	* Posts a new grid to the database. The post option requires exactly three parameters be added: the "solved_grid," the "puzzle_grid," and the "difficulty." Both grid parameters _must_ be supplied as (_exactly_) 81 character strings, and the supplied "puzzle_grid" _must_ be unique in the database. Incorrect parameters will return an error message with details of what went wrong.
* #### PUT /api/v1/grids/:id
	* Updates a grid in the database. This route has the same requirements of the parameters as the POST route, and must be attempting to update an existing grid. See above for details.
* #### DELETE /api/v1/grids/:id
	* Deletes the specified grid. Must specify an existing grid.




## Setup/Installation Requirements

_Please Notice: The "grids" supplied by seeding the database are random collections of characters 0 - 9. They are not intended to be used, and merely supply an idea of how data is returned._

To install:
* _Clone this repository_
* _CD into the project directory_
* _Run 'gem install bundler'_
* _Run 'bundle'_
* _Run 'rake db:create'_
* _Run 'rake db:migrate'_
* _Run 'rake db:seed'_
* _Run 'rails s'_
* _Make calls to the API using the routes outlined above!_


## Support and contact details

_For questions, comments, complaints, or confessions, please reach out to me at: <jaimegensler0@gmail.com>_


## Technologies Used

* _Ruby_
* _Rails_
* _rspec_


### License

This software is licensed under the MIT License.

Copyright (c) 2019 **_Jaime Gensler_**
