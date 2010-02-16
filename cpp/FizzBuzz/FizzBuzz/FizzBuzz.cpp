#include "FizzBuzz.h"


FizzBuzz::FizzBuzz(void)
{
}

FizzBuzz::~FizzBuzz(void)
{
}

std::string FizzBuzz::answer(int number)
{
	std::stringstream answer;
	
	answer << fizz(number) << buzz(number);
	if (answer.str() == "")
		answer << number;

	return answer.str();
}

std::string FizzBuzz::fizz(int number)
{
	return IsDivisibleByThree(number) ? "fizz" : "";
}

std::string FizzBuzz::buzz(int number)
{
	return IsDivisibleByFive(number) ? "buzz" : "";
}

bool FizzBuzz::IsDivisibleByThree(int number)
{
	return number != 0 && number % 3 == 0;
}

bool FizzBuzz::IsDivisibleByFive(int number)
{
	return number != 0 && number % 5 == 0;
}


