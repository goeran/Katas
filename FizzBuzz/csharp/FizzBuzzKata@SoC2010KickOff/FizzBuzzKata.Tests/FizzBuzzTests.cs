using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using NUnit.Framework;

namespace FizzBuzzKata.Tests
{
    [TestFixture]
    public class FizzBuzzTests
    {
        private FizzBuzz fizzBuzz;

        [SetUp]
        public void Setup()
        {
            fizzBuzz = new FizzBuzz();
        }

        [Test]
        public void Assure_number_undivisible_by_three_or_five_returns_number()
        {
            var numbers = new List<int>() {0, 1};

            foreach (var number in numbers)
            {
                var result = fizzBuzz.GetAnswer(number);
                Assert.AreEqual(Convert.ToString(number), result);
            }
            
        }

        [Test]
        public void Assure_numbers_divisible_by_3_returns_fizz()
        {
            var numbers = new List<int>() { 3,6,9};

            foreach (var number in numbers)
            {
                var result = fizzBuzz.GetAnswer(number);
                Assert.AreEqual("fizz", result);
            }
        }

        [Test]
        public void Assure_numbers_divisible_by_5_returns_buzz()
        {
            var numbers = new List<int>() { 5,10,20 };

            foreach (var number in numbers)
            {
                var result = fizzBuzz.GetAnswer(number);
                Assert.AreEqual("buzz", result);
            }
        }

        [Test]
        public void Assure_15_returns_fizzbuzz()
        {
            var result = fizzBuzz.GetAnswer(15);

            Assert.AreEqual("fizzbuzz", result);
        }

        [Test]
        public void Assure_30_returns_fizzbuzz()
        {
            var result = fizzBuzz.GetAnswer(30);

            Assert.AreEqual("fizzbuzz", result);
        }
    }
}
