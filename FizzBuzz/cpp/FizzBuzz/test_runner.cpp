/* Generated file, do not edit */

#ifndef CXXTEST_RUNNING
#define CXXTEST_RUNNING
#endif

#include <cxxtest/TestListener.h>
#include <cxxtest/TestTracker.h>
#include <cxxtest/TestRunner.h>
#include <cxxtest/RealDescriptions.h>
#include <cxxtest/StdioPrinter.h>
#include <cxxtest/Win32Gui.h>

int main( int argc, char *argv[] ) {
 return CxxTest::GuiTuiRunner<CxxTest::Win32Gui, CxxTest::StdioPrinter>( argc, argv ).run();
}
#include "testsuite.h"

static MyTestSuite suite_MyTestSuite;

static CxxTest::List Tests_MyTestSuite = { 0, 0 };
CxxTest::StaticSuiteDescription suiteDescription_MyTestSuite( "testsuite.h", 5, "MyTestSuite", suite_MyTestSuite, Tests_MyTestSuite );

static class TestDescription_MyTestSuite_testNumber_not_divisible_by_3_or_5_should_return_number_as_string : public CxxTest::RealTestDescription {
public:
 TestDescription_MyTestSuite_testNumber_not_divisible_by_3_or_5_should_return_number_as_string() : CxxTest::RealTestDescription( Tests_MyTestSuite, suiteDescription_MyTestSuite, 17, "testNumber_not_divisible_by_3_or_5_should_return_number_as_string" ) {}
 void runTest() { suite_MyTestSuite.testNumber_not_divisible_by_3_or_5_should_return_number_as_string(); }
} testDescription_MyTestSuite_testNumber_not_divisible_by_3_or_5_should_return_number_as_string;

static class TestDescription_MyTestSuite_testNumber_divisible_by_3_should_return_fizz : public CxxTest::RealTestDescription {
public:
 TestDescription_MyTestSuite_testNumber_divisible_by_3_should_return_fizz() : CxxTest::RealTestDescription( Tests_MyTestSuite, suiteDescription_MyTestSuite, 28, "testNumber_divisible_by_3_should_return_fizz" ) {}
 void runTest() { suite_MyTestSuite.testNumber_divisible_by_3_should_return_fizz(); }
} testDescription_MyTestSuite_testNumber_divisible_by_3_should_return_fizz;

static class TestDescription_MyTestSuite_testNumber_divisible_by_5_should_return_buzz : public CxxTest::RealTestDescription {
public:
 TestDescription_MyTestSuite_testNumber_divisible_by_5_should_return_buzz() : CxxTest::RealTestDescription( Tests_MyTestSuite, suiteDescription_MyTestSuite, 37, "testNumber_divisible_by_5_should_return_buzz" ) {}
 void runTest() { suite_MyTestSuite.testNumber_divisible_by_5_should_return_buzz(); }
} testDescription_MyTestSuite_testNumber_divisible_by_5_should_return_buzz;

static class TestDescription_MyTestSuite_testNumber_divisible_by_both_3_and_5_should_return_fizzbuzz : public CxxTest::RealTestDescription {
public:
 TestDescription_MyTestSuite_testNumber_divisible_by_both_3_and_5_should_return_fizzbuzz() : CxxTest::RealTestDescription( Tests_MyTestSuite, suiteDescription_MyTestSuite, 46, "testNumber_divisible_by_both_3_and_5_should_return_fizzbuzz" ) {}
 void runTest() { suite_MyTestSuite.testNumber_divisible_by_both_3_and_5_should_return_fizzbuzz(); }
} testDescription_MyTestSuite_testNumber_divisible_by_both_3_and_5_should_return_fizzbuzz;

#include <cxxtest/Root.cpp>
