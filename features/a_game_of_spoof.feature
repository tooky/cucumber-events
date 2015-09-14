Feature: Spoof Game

  Scenario:
    Given a game between:
      | player | coins in hand |
      | Dave   | 0             |
      | Celine | 1             |
    And Dave has guessed: 0
    When Celine guesses: 1
    Then Celine wins
