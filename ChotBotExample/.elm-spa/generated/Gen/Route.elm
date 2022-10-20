module Gen.Route exposing
    ( Route(..)
    , fromUrl
    , toHref
    )

import Gen.Params.About
import Gen.Params.Chat
import Gen.Params.Contact
import Gen.Params.Models
import Gen.Params.NotFound
import Gen.Params.Top
import Url exposing (Url)
import Url.Parser as Parser exposing ((</>), Parser)


type Route
    = About
    | Chat
    | Contact
    | Models
    | NotFound
    | Top


fromUrl : Url -> Route
fromUrl =
    Parser.parse (Parser.oneOf routes) >> Maybe.withDefault NotFound


routes : List (Parser (Route -> a) a)
routes =
    [ Parser.map About Gen.Params.About.parser
    , Parser.map Chat Gen.Params.Chat.parser
    , Parser.map Contact Gen.Params.Contact.parser
    , Parser.map Models Gen.Params.Models.parser
    , Parser.map NotFound Gen.Params.NotFound.parser
    , Parser.map Top Gen.Params.Top.parser
    ]


toHref : Route -> String
toHref route =
    let
        joinAsHref : List String -> String
        joinAsHref segments =
            "/" ++ String.join "/" segments
    in
    case route of
        About ->
            joinAsHref [ "about" ]
    
        Chat ->
            joinAsHref [ "chat" ]
    
        Contact ->
            joinAsHref [ "contact" ]
    
        Models ->
            joinAsHref [ "models" ]
    
        NotFound ->
            joinAsHref [ "not-found" ]
    
        Top ->
            joinAsHref [ "top" ]

