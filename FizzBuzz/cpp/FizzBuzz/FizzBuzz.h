#include <string>
#include <sstream>

class FizzBuzz
{
public:
	FizzBuzz(void);
	~FizzBuzz(void);

	std::string answer(int number);

private:
	bool IsDivisibleByThree(int number);
	bool IsDivisibleByFive(int number);
	std::string fizz(int number);
	std::string buzz(int number);
};
