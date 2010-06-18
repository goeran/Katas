using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace TennisKataSoC
{
    public class TennisGame
    {
        private int player1Score = 0;
        private int player2Score = 0;

        public String GetScore()
        {
            if (IsWinPlayer1()) return "player1 has won";

            if (IsWinPlayer2()) return "player2 has won";

            if (IsAdvantagePlayer2()) return "advantage player2";

            if (IsAdvantagePlayer1()) return "advantage player1";
            
            if (IsDeuce()) return "deuce";
            return ConvertScoreToString(player1Score) + " - " + ConvertScoreToString(player2Score);
        }

        private bool IsWinPlayer1()
        {
            return player1Score >= player2Score + 2 && player1Score > 3;
        }

        private bool IsWinPlayer2()
        {
            return player2Score >= player1Score + 2 && player2Score > 3;
        }

        private bool IsAdvantagePlayer2()
        {
            return player2Score == player1Score+1 && player2Score > 3;
        }

        private bool IsAdvantagePlayer1()
        {
            return player1Score == player2Score+1 && player1Score > 3;
        }

        private bool IsDeuce()
        {
            return player1Score == player2Score && player1Score > 2;
        }

        public void Player1Scores()
        {
            player1Score++;
        }

        public void Player2Scores()
        {
           player2Score++;
        }

        private String ConvertScoreToString(int score)
        {
            var values = new List<String>{"love", "15", "30", "40"};
            return values[score];
        }
    }
}