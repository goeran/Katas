using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace FizzBuzzKata
{
    public class FizzBuzz
    {
        public String GetAnswer(int number)
        {
            if (IsFizzBuzz(number)) return "fizzbuzz";
            if (IsFizz(number)) return "fizz";
            if (IsBuzz(number)) return "buzz";
            
            return Convert.ToString(number); 
        }

        private Boolean IsFizz(int number)
        {
            return number % 3 == 0 && number != 0;
        }

        private Boolean IsBuzz(int number)
        {
            return number % 5 == 0 && number != 0;
        }

        private Boolean IsFizzBuzz(int number)
        {
            return number % 15 == 0 && number != 0;
        }
    }
}
