namespace TennisKata
{
    public class TennisDefactored
    {
        private int p1, p2;

        public string PrintScore()
        {
            bool player1Wins = false;
            bool player2Wins = false;
            bool isDeuce = false;
            bool player1Advantage = false;
            bool player2Advantage = false;

            // SEE IF A PLAYER HAS WON
            if (p1 == 3 && p2 == 0)
            {
                player1Wins = true;
            }
            if (p1 == 0 && p2 == 3)
                player2Wins = true;
            if (p1 > 3 && p1 > p2 + 1)
                player1Wins = true;
            if (p2 > 3 && p2 > p1 + 1)
                player2Wins = true;

            // IF A PLAYER HAS NOT WON, THEN SEE IF IT IS JUICE
            if (p1 > 2 && p2 > 2 && p1 == p2)
                isDeuce = true;

            // IT MIGHT BE ADVANTAGE
            if (p1 > 2 && p2 > 2)
            {
                if (p1 == p2 + 1)
                    return "advantage Player1";
                if (p2 == p1 + 1)
                    return "advantage Player2";

                //ONE OF THE PLAYERS MIGHT HAVE WON
                if (p1 == p2 + 2)
                    return "Player1 wins";
                if (p2 == p1 + 2)
                    return "Player2 wins";
            }

            // PRINT THE SCORE OUT TO THE USER
            if (player1Wins)
                return "Player1 wins";
            else if (player2Wins)
                return "Player2 wins";
            else if (isDeuce)
                return "deuce";
            else if (player1Advantage)
                return "advantage Player1";
            else if (player2Advantage)
                return "advantage Player2";
            else
            {
                var score = string.Format("{0} - {1}", p1, p2);
                score = score.Replace("0", "love");
                score = score.Replace("1", "fifteen");
                score = score.Replace("2", "thirty");
                score = score.Replace("3", "forty");
                return score;
            }
        }

        public void Player1WinsTheBall()
        {
            p1++;
        }

        public void Player2WinsTheBall()
        {
            p2++;
        }
    }
}
