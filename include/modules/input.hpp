#ifndef INPUT_HPP
#define INPUT_HPP

// project includes
#include "modules/data.hpp"

// c++ includes
#include <iostream>
#include <sstream>

/*
	Input namespace is responsible for pulling in data
	This is how we should generally interact with the user for the testing segment of the application etc
*/
namespace input {

	// get string data using only string streams etc
	Data getStringData(int lines = 1);

	// make sure that we are only getting integers into an array and then return that
	Data getIntegerData(int lines = 1);

	// extract only letters from a bunch of chars
	Data extractStringData(const char * content);//extract the string data from a raw array of characters

	// extract only integers from a bunch of chars
	// require that we pass in a const char element so that the user doesn't have to include the c string element before hand
	Data extractIntegerData(const char * content);//extract the string data from a raw array of characters	
	
}


#endif