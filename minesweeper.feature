
Feature: Minesweeper game

    As a user I want to play "Minesweeper" game

Scenario: Open "Minesweeper" app
    Given "Minesweeper" is instailled
    When user opens "Minesweeper" 
    Then "Minesweeper" app should be oppened 

Scenario: "Minesweeper" deafult state
    When user opens "Minesweeper" 
    Then Game field should be visible
    And Game field high is 16 cells
    And Game field weigh is 30 cells
    And "Hidden mines" counter shows 099
    And timer should be 000
    And "Restart" button should be "positive smile"

Scenario: Game options deafult state
    When user clicks on "game options" button
    Then game options window should contain the following elements
    |radio button state|difficulty value  |high|width|mines|
    |unchecked         |beginner          |9   |9    |10   |
    |unchecked         |expierenced       |16  |16   |40   |
    |checked           |expert            |16  |30   |99   |
    |unchecked         |special           |20  |30   |145  |
    And "Marks(?)" checkbox should be unchecked
    And "New game" button should be shown
    And "Exit" button should be shown

Scenario Outline: Choose difficulty mode    
    Given user clicked on "game options" button
    When user clicks on <difficulty> radio button
    And  clicks on "New game" button
    Then Game field should be visible
    And Game field high is <high> cells
    And Game field weigh is <width> cells
    And "Hidden mines" counter shows <mines>
    And timer should be 000

Examples: Game options menu
    |difficulty  |high|width|mines|
    |beginner    |9   |9    |10   |
    |expierenced |16  |16   |40   |
    |expert      |16  |30   |99   |
    |special     |20  |30   |145  |

# Cells position goes from (0,0)
Scenario: Allowing to mark cells with question mark
    Given Settings window is opened 
    When user clicks "Marks(?)" checkbox
    And  clicks on "New game" button 
    And  double clicks by right mouse button on cell (1,1)
    Then cell (1,1) should be marked as "?"

Scenario Outline: Choosing Special mode
    Given game options window is opened 
    When user clicks on "special" mode radio button
    And user inputs <high> into "high" text field
    And user inputs <width> into "width" text field
    And user inputs <mines> into "mines" text field 
    And user clicks on "New game" button
    Then New game should start with <high> high 
    And <width> width 
    And mine counter should show <mines> mines
    And timer should show 000

Examples: Game field input parameters
    |high|width |mines| 
    |15  |25    |100  |
    |20  |30    |599  |
    |1   |8     |7    |
    |1   |8     |0    |
    |99  |99    |9800 |
    |99  |99    |0    |

Scenario Outline: Special mode invalid values
    Given game options window is opened 
    When user clicks on "special" mode radio button
    And user inputs <high> into "high" text field
    And user inputs <width> into "width" text field
    And user inputs <mines> into "mines" text field 
    And user clicks on "New game" button
    Then New game should start with 20 high 
    And 30 width 
    And mine counter should show 145 mines
    And timer should show 000

    Examples: Game field invalid input parameters
    |high|width |mines| 
    |0   |0     |0    |
    |0   |7     |0    |
    |100 |100   |9801 |
    |20  |30    |600  |
    |a   |a     |a    |
    |20  |30    |a    |
    |10,5|10,5  |10,5 |
    |$   |$     |$    |
    |20  |30    |$    |
    |NULL|NULL  |NULL |

Scenario Outline: Changing scale of game field
    Given display field is opened
    And scale <scale> radio button is <status> 
    When user clicks unchecked radio button
    Then Size of game field changes to <scale>
    And scale <scale> radio button is <status> 

Example: display field
    |status      |scale|
    |unchecked   |100% |
    |checked     |150% |
    |unchecked   |200% |

Scenario: Changing position of game field
    Given display field is opened
    And position <place> radio button is <status>
    When user clicks on position <place> radio button
    Then game field changes position to <place>
    And position <place> radio button turns <status>

Examples: game field position
    |status   |place  |
    |unchecked|left   |
    |checked  |central|

Scenario: "Restart" button check
    Given user started new game
    And user clicked on cell (1,1)
    And "Restart" button should be "positive smile"
    When user clicks on "Restart" button
    Then new game should start

Scenario: "Restart" button changes
    Given user started new game
    And user clicked on cell (1,1)
    And "Restart" button should be "positive smile"
    When user clicks on cell with mine
    Then "Restart" button should change to "negative smile"

