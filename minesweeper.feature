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
* User inputs <value> of game field into "high" text field
* User inputs <value> of game field into "width" text field
* User inputs <value> into "mines" text field 
* User clicks on "New game" button
Then New game should start with <value> high of game field
And <value> width of game field
And mine counter should show <value> mines
And timer should show 000

Example: Game field input parameters
|text field|value |
|high      |number|
|width     |number|
|mines     |number|

 
Scenario: Creating game field with minimal size 
Given game options window is opened 
When User clicks on "special" mode radio button
* User inputs "1" into "high" text field
* User inputs "8" into "width" text field 
* user clicks on "New game" button
Then New game should start with game field high 1
And game field width 8


Scenario: Creating game field with maximal size 
Given game options window is opened 
When User clicks on "special" mode radio button
* User inputs "99" into "high" text field
* User inputs "99" into "width" text field 
* user clicks on "New game" button
Then New game should start with game field high 99
And game field width 99

Scenario: Inputing values less than boundaries
Given game options window is opened 
When User clicks on "special" mode radio button
* User inputs "0" into "high" text field
* User inputs "7" into "width" text field 
* user clicks on "New game" button
Then New game should start with game field high 1
And game field width 8

Scenario: Inputing values more than boundaries
Given game options window is opened 
When User clicks on "special" mode radio button
* User inputs "100" into "high" text field
* User inputs "100" into "width" text field 
* user clicks on "New game" button
Then New game should start with game field high 99
And game field width 99

Scenario: Inputing negative values 
Given game options window is opened 
When User clicks on "special" mode radio button
* User inputs "-1" into "high" text field
* User inputs "-1" into "width" text field 
* user clicks on "New game" button
Then New game should start with game field high 1
And game field width 8

Scenario: Inputing letters
Given game options window is opened 
When User clicks on "special" mode radio button
* User inputs "a" into "high" text field
* User inputs "a" into "width" text field 
* user clicks on "New game" button
Then New game should start with game field high 20
And game field width 30

Scenario: Inputing special symbols
Given game options window is opened 
When User clicks on "special" mode radio button
* User inputs "@" into "high" text field
* User inputs "@" into "width" text field 
* user clicks on "New game" button
Then New game should start with game field high 20
And game field width 30

Scenario: Inputing empty values symbols
Given game options window is opened 
When User clicks on "special" mode radio button
* User deletes "20" from "high" text field
* User deletes "30" from "width" text field 
* user clicks on "New game" button
Then New game should start with game field high 20
And game field width 30

Scenario: Creating game field with maximal amount of mines
Given game options window is opened 
When User clicks on "special" mode radio button
* User inputs "599" into "mines" text field
* User clicks on "New game" button
Then New game should start with game field high 20
And game field width 30
And mines counter should show 599

Scenario: Creating game field with minimal amount of mines
Given game options window is opened 
When User clicks on "special" mode radio button
* User inputs "0" into "mines" text field
* User clicks on "New game" button
Then New game should start with game field high 20
And game field width 30
And mines counter should show 000

Scenario: Creating game field with amount of mines same as amount of cells
Given game options window is opened 
When User clicks on "special" mode radio button
* User inputs "600" into "mines" text field
* User clicks on "New game" button
Then New game should start with game field high 20
And game field width 30
And mines counter should show 599

Scenario: Creating game field with amount of mines more than amount of cells
Given game options window is opened 
When User clicks on "special" mode radio button
* User inputs "601" into "mines" text field
* User clicks on "New game" button
Then New game should start with game field high 20
And game field width 30
And mines counter should show 599

Scenario: Inputing negative number into "mines" text field
Given game options window is opened 
When User clicks on "special" mode radio button
* User inputs "-1" into "mines" text field
* User clicks on "New game" button
Then New game should start with game field high 20
And game field width 30
And mines counter should show 000

Scenario: Inputing letters into "mines" text field
Given game options window is opened 
When User clicks on "special" mode radio button
* User inputs "a" into "mines" text field
* User clicks on "New game" button
Then New game should start with game field high 20
And game field width 30
And mines counter should show 000

Scenario: Inputing special symbols into "mines" text field
Given game options window is opened 
When User clicks on "special" mode radio button
* User inputs "&" into "mines" text field
* User clicks on "New game" button
Then New game should start with game field high 20
And game field width 30
And mines counter should show 000

Scenario: Inputing empty value into "mines" text field
Given game options window is opened 
When User clicks on "special" mode radio button
* User deletes "145" from "mines" text field
* User clicks on "New game" button
Then New game should start with game field high 20
And game field width 30
And mines counter should show 145


Scenario Outline: Changing scale of game field
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

Scenario Outline: Starting a game in 
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

