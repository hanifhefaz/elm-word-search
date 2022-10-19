module WordSearcher exposing
    ( findRelevantDict
    , wordsDict
    , sentenceHistograms
    , tokenize
    , stopWords
    , toHistogram
    )

{-|


# Result

@docs findRelevantDict


# Words Dictionary

@docs wordsDict


# Sentence Histograms

@docs sentenceHistograms


# Tokenization

@docs tokenize


# StopWords

@docs stopWords


# ToHistogram

@docs toHistogram

-}

import Dict exposing (..)
import Html exposing (..)
import Documents exposing (..)


type alias Sentence =
    String


type alias Tokens =
    List String


type alias Histogram =
    Dict String Int


{-| This will make a dictionary from a sentence
-}
wordsDict : Tokens -> Histogram
wordsDict vocabulary =
    vocabulary
        |> List.concatMap tokenize
        |> toHistogram


{-| Finds the sentences with the most occurances from a search string
Returns the related result for the returned quesiton in the data.
-}
findRelevantDict : Dict String Int -> List Documents.Result -> Maybe Documents.Result
findRelevantDict firstDict results =
    case List.foldl (score firstDict) Nothing results of
        Just (Score result _) ->
            Just result

        Nothing ->
            Nothing


type Score
    = Score Documents.Result { size : Int, matches : Int }


score : Histogram -> Documents.Result -> Maybe Score -> Maybe Score
score firstDict result prevBest =
    let
        thisHistogram =
            result.query |> tokenize |> toHistogram

        thisSize =
            Dict.size thisHistogram

        thisMatches =
            thisHistogram
                |> Dict.intersect firstDict
                |> Dict.size

        this =
            Score result { size = thisSize, matches = thisMatches }
    in
    case prevBest of
        Nothing ->
            Just this

        Just (Score _ { size, matches }) ->
            if thisMatches > matches && thisMatches >= 2 then
                Just this

            else if thisMatches == matches then
                if thisSize < size then
                    Just this

                else
                    prevBest

            else
                prevBest


{-| This will tokenize the words and remove symbols.
-}
tokenize : Sentence -> Tokens
tokenize =
    String.filter (\c -> c == ' ' || Char.isAlpha c)
        >> String.toLower
        >> String.words
        >> List.filter (\x -> not <| List.member x stopWords)


{-| This will convert sentences to words histograms.
-}
toHistogram : Tokens -> Histogram
toHistogram =
    List.foldl
        (\key dict ->
            case Dict.get key dict of
                Nothing ->
                    Dict.insert key 1 dict

                Just count ->
                    Dict.insert key (count + 1) dict
        )
        Dict.empty


{-| This will make a dictionary from data and do some tokenization as well.
-}
sentenceHistograms : List Sentence -> List Histogram
sentenceHistograms =
    List.map (tokenize >> toHistogram)


{-| This will remove all stopWords from the data, which are mentioned here.
-}
stopWords : Tokens
stopWords =
    [ "a"
    , "able"
    , "about"
    , "across"
    , "after"
    , "all"
    , "almost"
    , "also"
    , "am"
    , "among"
    , "an"
    , "and"
    , "any"
    , "are"
    , "as"
    , "at"
    , "be"
    , "because"
    , "been"
    , "but"
    , "by"
    , "can"
    , "cannot"
    , "could"
    , "dear"
    , "did"
    , "do"
    , "does"
    , "either"
    , "else"
    , "ever"
    , "every"
    , "for"
    , "from"
    , "get"
    , "got"
    , "had"
    , "has"
    , "have"
    , "he"
    , "her"
    , "hers"
    , "him"
    , "his"
    , "how"
    , "however"
    , "i"
    , "if"
    , "in"
    , "into"
    , "is"
    , "it"
    , "its"
    , "just"
    , "least"
    , "let"
    , "like"
    , "likely"
    , "may"
    , "me"
    , "might"
    , "most"
    , "must"
    , "my"
    , "neither"
    , "no"
    , "nor"
    , "not"
    , "of"
    , "off"
    , "often"
    , "on"
    , "only"
    , "or"
    , "other"
    , "our"
    , "own"
    , "rather"
    , "said"
    , "say"
    , "says"
    , "she"
    , "should"
    , "since"
    , "so"
    , "some"
    , "than"
    , "that"
    , "the"
    , "their"
    , "them"
    , "then"
    , "there"
    , "these"
    , "they"
    , "this"
    , "tis"
    , "to"
    , "too"
    , "twas"
    , "us"
    , "wants"
    , "was"
    , "we"
    , "were"
    , "what"
    , "when"
    , "where"
    , "which"
    , "while"
    , "who"
    , "whom"
    , "why"
    , "will"
    , "with"
    , "would"
    , "yet"
    , "you"
    , "your"
    ]
