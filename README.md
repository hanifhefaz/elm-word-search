# elm-word-search

This package is written to find the most relevant result to your search query in a pre-defined set of queries and results.


## example

your search query for this string: `I want to play football in the morning`

and your documents include multiple sentences like:

`I like to play football with my friend`

`He is not able to play football in the morning`

The result you get will be `He is not able to play football in the morning` since it contains multiple words that match the search query.

## Usage

One basic example where this package can come handy is to use it in your websites chat bots.

For example you define all your FAQs and their relevant answers in the Documents module, and whenever a customer tries to ask something, his/her query will get a relevant pre-defined answer from the list you defined already. 

# contributions

PLEASE READ THE CONTRIBUTING FILE.

## usage examples:

a minimal working example is here: https://ellie-app.com/jVZngXZnM5Wa1 

a chatbot example is implemented in ChatBotExample folder.

## Installation

# using npm:

`npm i elm-word-search`

## using elm 

`elm install hanifhefaz/elm-word-search`
