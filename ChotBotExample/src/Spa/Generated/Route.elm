module Spa.Generated.Route exposing
    ( Route(..)
    , fromUrl
    , toString
    )

import Url exposing (Url)
import Url.Parser as Parser exposing ((</>), Parser)


type Route
    = Top
    | About
    | Chat
    | Contact
    | Models
    | NotFound


fromUrl : Url -> Maybe Route
fromUrl =
    Parser.parse routes


routes : Parser (Route -> a) a
routes =
    Parser.oneOf
        [ Parser.map Top Parser.top
        , Parser.map About (Parser.s "about")
        , Parser.map Chat (Parser.s "chat")
        , Parser.map Contact (Parser.s "contact")
        , Parser.map Models (Parser.s "models")
        , Parser.map NotFound (Parser.s "not-found")
        ]


toString : Route -> String
toString route =
    let
        segments : List String
        segments =
            case route of
                Top ->
                    []
                
                About ->
                    [ "about" ]
                
                Chat ->
                    [ "chat" ]
                
                Contact ->
                    [ "contact" ]
                
                Models ->
                    [ "models" ]
                
                NotFound ->
                    [ "not-found" ]
    in
    segments
        |> String.join "/"
        |> String.append "/"