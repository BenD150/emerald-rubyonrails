# README

This README would normally document whatever steps are necessary to get the
application up and running.

<h1><img src="https://cdn1.iconfinder.com/data/icons/business-analytics-6/91/Business_analytics_15-512.png" width="40" height="40"> Team Emerald <img src="https://cdn1.iconfinder.com/data/icons/business-analytics-6/91/Business_analytics_15-512.png" width="40" height="40"></h1>

Zach Salem, Julia Kolnicki, Ben Dollenmayer

# Ruby version

# System dependencies

# Configuration

# Database creation

# Database initialization

# How to run the test suite

# Services (job queues, cache servers, search engines, etc.)

# Deployment instructions

# The Game of Set - Reloaded

We recreated the Game of Set from Project 2, but this time using HTML/CSS/JS. This game includes a few extra features over the base game, including:
- both single-player and multi-player gamemodes
- a timer to race against in single player mode
- a hint generator that gives up to four hints per game state

## Building the Project

To try out some JavaScript testing, we used Jest.
This package needs to be installed with `npm install` while in the root directory.
Then, simply open `set.html` in a browser and enjoy!

## Testing

Simply run `npm run test` to execute all the test cases in `logic.test.js`.

## Style

Style based off of HTML and CSS standards, as well as idiometic JavaScript.

## Code Organization

Due to the game logic being implemented in JavaScript, it is largely function-based with a few global variables.

Function sections include:
* Event Handlers: These get called by various actions the user can perform, including clicking a card or button, or pressing a key
* Game Logic: These handle the logic of the game of set itself, including generating hints and checking if three cards are a set
* Graphical State Changers: These toggle which sections are visible, and render the cards and the table
* Helpers: This single function helps to shuffle a JavaScript array

Global variables include:
* `deck`: An arry of cards still in the deck
* `table`: An array of cards that are currently on the table
* `mode`: 1 for single-player and 2 for multi-player
* `player`: The player that is currently entering a set, always 1 in single-player mode
* `hint_count`: The number of hints to show when the player next asks for one
* `picks`: The indexes of the cards currently picked from the table