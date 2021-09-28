
Feature:user looses "Minesweeper" game

Background: "Minesweeper" app cheating mode is enabled
    Given "Minesweeper" app is opened
    When user enables cheating mode
    Then all hidden mines should be shown 

@EndToEnd@
Scenario: User starts new game as "Beginner"  
    Given user clicked on "game options" button
    When user clicks on "Beginner" radio button
    And  clicks on "New game" button
    Then Game field should be visible
    And Game field high is 9 cells
    And Game field weigh is 9 cells
    And "Hidden mines" counter should show 010
    And timer should be 000
    And "Restart" button should be "positive smile"

Scenario: User makes first click
    Given user started a game
    When user clicks on (1,1) cell
    Then Then cell (1,1) should be oppened
    And all neighboring emty cells should be opened
    And all hidden mines should be shown
    And timer should start running
    But cell (2,5) should not contain mine

Scenario: User clicks on cell with mine
    Given user made first click on cell (1,1)
    And timer started running
    And "Restart" button should be "positive smile"
    When user clicks on cell with mine
    Then "Restart" button should turn "negative smile"
    And timer should stop

Scenario: User looses a game because of time
    Given user made first click on cell (1,1)
    And timer started running
    And "Restart" button should be "positive smile"
    When timer shows "999"
    Then "Restart" button should turn "negative smile"
    