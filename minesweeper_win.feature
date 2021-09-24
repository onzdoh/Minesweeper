user wins "Minesweeper" game 
Rule: "Minesweeper" app cheating mode is enabled
    Given "Minesweeper" app is opened
    When user enables cheating mode
    Then all hidden mines should be shown 
    And all cells should show <cell marking> if they have <mines nearby> mines nearby

Examples: cells marking 
    |cell marking|mines nearby|
    |1           |1           |
    |2           |2           |
    |3           |3           |
    |4           |4           |
    |5           |5           |
    |6           |6           |
    |7           |7           |
    |8           |8           |

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


Scenario: First click in new game on emty cell
    Given user started new game
    And user enabled "cheating mode"
    When user clicks on cell (5,2)      
    Then cell (2,5) should be oppened
    And all neighboring emty cells should be opened
    And all hidden mines should be shown
    And all cells that have <mines nearby> should show number <cell marking>
    And timer should start running
    But cell (2,5) should not contain mine

Scenario: First click in new game on cell containing neighboring mines 
    Given user started new game
    And user enabled "cheating mode"
    When user clicks on cell (5,2)      
    Then cell (2,5) should be opened
    And cell (2,5) should snow <cell marking> of neighboring mines
    And all hidden mines should be shown
    And all cells that have <mines nearby> neighboring mines should show number <cell marking>
    And all neighboring emty cells should be opened
    But cell (2,5) should not contain mine

Scenario Outline: Opening unmarked emty cells 
    Given user made first click on cell (2,5)
    And hidden mines are shown
    When user clicks on unmarked cells
    Then all neighboring cells without mines should be opened 
    And marked cells wih <mines nearby> neighboring mines should show <cell marking>

Scenario Outline: Marking mines with "Flag" mark
    Given all hidden mines are shown
    When user double clicks right button of mouse on cell with hidden mine
    Then cell should be marked by "Flag" mark
    And "Hidden mines" counter should show 

Scenario: user wins game
    When user opens all empty cells
    And user marks all cells with mines by "Flag" mark
    Then timer should stop
    And "Restart" button should be changed to "positive smile in sunglasses"

