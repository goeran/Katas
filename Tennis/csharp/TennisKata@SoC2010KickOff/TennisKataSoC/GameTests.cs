using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using NUnit.Framework;

namespace TennisKataSoC
{
    [TestFixture]
    public class GameTests
    {
        private TennisGame game;

        [Test]
        public void Assure_valid_scores()
        {
            var table = GetTestTable();

            foreach (var row in table)
            {
                game = new TennisGame();

                Play_a_set((int)row[0], (int)row[1]);
                
                Assert.AreEqual(row[2], game.GetScore());
            }
        }

        public void Play_a_set(int player1Score, int player2Score)
        {
            for (int i = 0; i < player1Score; i++)
            {
                game.Player1Scores();
            }
            for (int i = 0; i < player2Score; i++)
            {
                game.Player2Scores();
            }
        }

        private List<List<Object>> GetTestTable()
        {
            var table = new List<List<Object>>()
                {
                    new List<Object>() {0, 0, "love - love"},
                    new List<Object>() {0, 1, "love - 15"},
                    new List<Object>() {1, 0, "15 - love"},
                    new List<Object>() {1, 1, "15 - 15"},
                    new List<Object>() {0, 2, "love - 30"},
                    new List<Object>() {1, 2, "15 - 30"},
                    new List<Object>() {2, 2, "30 - 30"},
                    new List<Object>() {2, 0, "30 - love"},
                    new List<Object>() {2, 1, "30 - 15"},
                    new List<Object>() {0, 3, "love - 40"},
                    new List<Object>() {1, 3, "15 - 40"},
                    new List<Object>() {2, 3, "30 - 40"},
                    new List<Object>() {3, 3, "deuce"},
                    new List<Object>() {3, 0, "40 - love"},
                    new List<Object>() {3, 1, "40 - 15"},
                    new List<Object>() {3, 2, "40 - 30"},
                    new List<Object>() {0, 4, "player2 has won"},
                    new List<Object>() {4, 4, "deuce"},
                    new List<Object>() {4, 0, "player1 has won"},
                    new List<Object>() {4, 3, "advantage player1"},
                    new List<Object>() {14, 15, "advantage player2"}

                };
            return table;
        }
    }
}
