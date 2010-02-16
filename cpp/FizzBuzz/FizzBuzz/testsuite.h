#include <cxxtest/TestSuite.h>
#include <stdio.h>
#include "FizzBuzz.h";

class MyTestSuite : public CxxTest::TestSuite
{
private:
	FizzBuzz *fb;

public:

	void setUp()
	{
		fb = new FizzBuzz();
	}

	void testNumber_not_divisible_by_3_or_5_should_return_number_as_string()
	{
		int numbers[] = {0, 1, 2, 4, 7, 8, 11};
		char numberAsString[3];
		for (int n = 0; n <= 6; n++)
		{
			sprintf(numberAsString, "%d", numbers[n]);
			TS_ASSERT_EQUALS(fb->answer(numbers[n]), numberAsString);
		}
	}

	void testNumber_divisible_by_3_should_return_fizz()
	{
		int numbers[] = {3, 6, 9, 12, 18, 21, 24};
		for (int n = 0; n < 7; n++)
		{
			TS_ASSERT_EQUALS(fb->answer(numbers[n]), "fizz");
		}
	}

	void testNumber_divisible_by_5_should_return_buzz()
	{
		int numbers[] = {5, 10, 20, 25, 35, 40};
		for (int n = 0; n < 6; n++)
		{
			TS_ASSERT_EQUALS(fb->answer(numbers[n]), "buzz");
		}
	}

	void testNumber_divisible_by_both_3_and_5_should_return_fizzbuzz()
	{
		int numbers[] = {15, 30, 45, 60, 75, 90};
		for (int n = 0; n < 6; n++)
		{
			TS_ASSERT_EQUALS(fb->answer(numbers[n]), "fizzbuzz");
		}
	}

};