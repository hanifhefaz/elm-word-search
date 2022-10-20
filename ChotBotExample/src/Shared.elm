module Shared exposing
    ( Flags
    , Model
    , Msg
    , init
    , subscriptions
    , update
    , view
    )

import Browser.Navigation exposing (Key)
import Html exposing (..)
import Html.Attributes exposing (class, href)
import Spa.Document exposing (Document)
import Spa.Generated.Route as Route
import Url exposing (Url)
import Html exposing (..)
import Html.Attributes exposing (..)



-- INIT


type alias Flags =
    ()


type alias Model =
    { url : Url
    , key : Key
    }


init : Flags -> Url -> Key -> ( Model, Cmd Msg )
init flags url key =
    ( Model url key
    , Cmd.none
    )



-- UPDATE


type Msg
    = ReplaceMe


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        ReplaceMe ->
            ( model, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- VIEW


view :
    { page : Document msg, toMsg : Msg -> msg }
    -> Model
    -> Document msg
view { page, toMsg } model =
    { title = page.title
    , body =
        [ div [ class "layout" ]
            [ nav [ class "navbar fixed-top navbar-expand-md custom-navbar navbar-dark" ]
    [ img [ alt "logo", class "navbar-brand", id "logo_custom", src "mylogo.png", attribute "width" "10%" ]
        []
    , button [ class "navbar-toggler navbar-toggler-right custom-toggler", attribute "data-target" "#collapsibleNavbar", attribute "data-toggle" "collapse", type_ "button" ]
        [ span [ class "navbar-toggler-icon " ]
            []
        ]
    , div [ class "collapse navbar-collapse ", id "collapsibleNavbar" ]
        [ ul [ class "navbar-nav ml-auto " ]
            [ li [ class "nav-item" ]
                [ a [ class "nav-link", href (Route.toString Route.Top) ]
                    [ b []
                        [ text "Home" ]
                    ]
                ]
            , li [ class "nav-item" ]
                [ a [ class "nav-link", href (Route.toString Route.Models) ]
                    [ b []
                        [ text "Models" ]
                    ]
                ]
            , li [ class "nav-item" ]
                [ a [ class "nav-link", href (Route.toString Route.Contact) ]
                    [ b []
                        [ text "Contact" ]
                    ]
                ]
            , li [ class "nav-item" ]
                [ a [ class "nav-link", href (Route.toString Route.About) ]
                    [ b []
                        [ text "About" ]
                    ]
                ]
            , li [ class "nav-item" ]
                [ a [ class "nav-link", href (Route.toString Route.Chat) ]
                    [ b []
                        [ text "Chat" ]
                    ]
                ]
            ]
        ]
    ]
            , div [ class "page" ] page.body
            , div[ class "site-footer"][ text "[ Built with "
        , a [ class "text-underline hoverable", Html.Attributes.target "_blank", href "https://elm-lang.org" ] [ text "Elm" ]
        , text " ]"
        ]
            ]
        ]

    }
