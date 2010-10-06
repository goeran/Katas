using System;

namespace TennisKata
{
    public class Tennis
    {
        private int winsPlayer1, winsPlayer2;
        private const int love = 0;
        private const int forty = 3;

        public string PrintScore()
        {
            if (OnePlayerHasMoreThan(forty) && OnPlayerHas(love))
                return LeadingPlayer() + " wins";

            if (OnePlayerHasMoreThan(forty) && APlayerLeadByTwoOrMoreBalls())
                return LeadingPlayer() + " wins";

            if (BothPlayersHas(forty) && ScoreIsEqual())
                return "deuce";

            if (BothPlayersHas(forty) && APlayerLeadByOneBall())
                return "advantage " + LeadingPlayer();

            if (BothPlayersHas(forty) && APlayerLeadByTwoOrMoreBalls())
                return LeadingPlayer() + " wins";

            return string.Format("{0} - {1}", Score(winsPlayer1), Score(winsPlayer2));
        }

        private bool OnePlayerHasMoreThan(int score)
        {
            return winsPlayer1 > score || winsPlayer2 > score;
        }

        private bool OnPlayerHas(int score)
        {
            return winsPlayer1 == score || winsPlayer2 == score;
        }

        private bool BothPlayersHas(int score)
        {
            return winsPlayer1 >= score && winsPlayer2 >= score;
        }

        private string LeadingPlayer()
        {
            return winsPlayer1 > winsPlayer2 ? "Player1" : "Player2";
        }

        private bool ScoreIsEqual()
        {
            return winsPlayer1 == winsPlayer2;
        }

        private bool APlayerLeadByOneBall()
        {
            return winsPlayer1 == winsPlayer2 + 1 || winsPlayer2 == winsPlayer1 + 1;
        }

        private bool APlayerLeadByTwoOrMoreBalls()
        {
            return winsPlayer1 >= winsPlayer2 + 2 || winsPlayer2 >= winsPlayer1 + 2;
        }

        private static string Score(int balls)
        {
            if (balls == 1) return "fifteen";
            if (balls == 2) return "thirty";
            if (balls == 3) return "forty";
            
            return "love";
        }

        public void Player1WinsTheBall()
        {
            winsPlayer1++;
        }

        public void Player2WinsTheBall()
        {
            winsPlayer2++;
        }
    }
}
