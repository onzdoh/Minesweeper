gherkin
Feature: Minesweeper game

    As a user I want to play minesweeper game

Scenario: Oppening minesweeper
Given minesweeper is instailed
When User opens minesweeper 
Then minesweeper app should be oppened 

Scenario: Oppening minesweeper
Given minesweeper is instailed
When User opens minesweeper 
Then Game field should be opened
* Game field high is 16
* Game field weigh is 30
* hidden mines counter shows 099
* timer should be 000

Scenario: Oppening game options
Given minesweeper is opened
When User clicks on "game options" button
Then game options window should show
 |radio button|difficulty  |high|width|mines|
 |unchecked   |beginner    |9   |9    |10   |
 |unchecked   |expierenced |16  |16   |40   |
 |checked     |expert      |16  |30   |99   |
* "Special" radio button should be unchecked
* "Special" high text field should be 20
* "Special" width text field should be 30
* "Special" mines text field should be 145
* "Marks(?)" checkbox should be unchecked
* "New game" button should be shown
* "Exit" button should be shown

Scenario Outline: Choosing difficulty mode
Given User clicked on "game options" button
When User clicks on <difficulty> radio button
And user clicks on "New game" button
Then New game should start with game field high <high>
* game field width <width> 
* hidden mines counter should show <mines>
* timer should show 000

Example: Game options menu
 |difficulty  |high|width|mines|
 |beginner    |9   |9    |10   |
 |expierenced |16  |16   |40   |
 |expert      |16  |30   |99   |


Scenario: Allowing to mark cells with question mark
Given Settings window is opened 
When User clicks on difficulty radio button
And user clicks "Marks(?)" checkbox
And user clicks on "New game" button 
And user double clicks by right mouse button on cell (1,1)
Then cell (1,1) should be marked as "?"

Scenario Outline: Choosing Special mode
Given game options window is opened 
When User clicks on "special" mode radio button
* User inputs high of game field into "high" text field
* User inputs width of game field into "width" text field
* User inputs amount of mines into "mines" text field 
* user clicks on "New game" button
Then New game starts with choosen size of playing field and amount of mines

Example: Game field input parameters

 
|Scenario: Creating game field with minimal size 
Given game options window is opened 
When User clicks on "special" mode radio button
* User inputs high of game field into "high" text field
* User inputs width of game field into "width" text field
* User inputs amount of mines into "mines" text field 
* user clicks on "New game" button
Then New game starts with choosen size of playing field and amount of mines
 
 Example: Game field parameters boundary values
|parameter|value|
|min high |1    |
|max high |99   |
|min weigh|8    |
|max weigh|99   |
|min mines|


Scenario Outline: Changing size of game field
Given display field is opened
And scale <scale> radio button is <status> 
When User clicks unchecked radio button
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
When User clicks on position <place> radio button
Then game field changes position to <place>
And position <place> radio button turns <status>

Example: position field
|status   |place  |
|unchecked|left   |
|checked  |central|

Scenario: Starting a game
Given Game field is opened
When User clicks random cell ##написать негативнфй тест когда юзер сразу попадает на мину 
Then all nearby cells without mines turn empty or show numbers from 1 to 8, timer starts running

