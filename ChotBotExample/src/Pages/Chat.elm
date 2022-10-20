module Pages.Chat exposing (Model, Msg, Params, page)

import Browser exposing (sandbox)
import Dict exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput, onSubmit)
import Documents
import Spa.Document exposing (Document)
import Spa.Page as Page exposing (Page)
import Spa.Url as Url exposing (Url)
import String exposing (append)
import WordSearcher exposing (..)


page : Page Params Model Msg
page =
    Page.sandbox
        { init = init
        , view = view
        , update = update
        }


type alias Message =
    { participant : Participant, message : String }


type alias Model =
    { messages : List Message
    , message : String
    }


type Participant
    = Human
    | Bot


type Msg
    = TypedMessage String
    | PostedMessage String


type SearchResult
    = NotSearched
    | Searched (Maybe Documents.Result)


type alias Params =
    ()


init : Url Params -> Model
init { params } =
    { messages = []
    , message = ""
    }


update : Msg -> Model -> Model
update msg model =
    case msg of
        TypedMessage str ->
            { model | message = str }

        PostedMessage "" ->
            { model | message = "" }

        PostedMessage str ->
            let
                result =
                    Searched <| WordSearcher.findRelevantDict (str |> WordSearcher.tokenize |> WordSearcher.toHistogram) Documents.data

                resultMessage =
                    case result of
                        Searched a ->
                            case a of
                                Just ans ->
                                    ans.result

                                _ ->
                                    ""

                        _ ->
                            ""
            in
            { model
                | messages =
                    { participant = Bot, message = resultMessage }
                        :: { participant = Human, message = str }
                        :: model.messages
                , message = ""
            }


viewMessage : Message -> Html Msg
viewMessage { participant, message } =
    case participant of
        Human ->
            div [ style "background-color" "#0B62B8", style "padding" "5px", style "color" "white", style "font-size" "18px" ] [ i [] [ text message ] ]

        Bot ->
            div [ style "background-color" "#F1F2F3", style "padding" "5px", style "font-size" "15px" ] [ i [] [ text message ] ]


view : Model -> Document Msg
view model =
    { title = "Main"
    , body =
        [ div [ class "row py-5" ]
            [ div [ class "col-lg-12 mx-auto" ]
                [ div [ class "text-white p-5 shadow-sm rounded banner" ]
                    [ h1 [ class "display-4" ]
                        [ text "Ask our Agent Anything" ]
                    , p [ class "lead" ]
                        [ text "Do you have any question, regarding our products?" ]
                    ]
                ]
            ]
        , p [ style "margin" "auto", style "text-align" "center" ] [ text "pleas type your question here and press Enter" ]
        , div [ style "width" "25%", style "margin" "auto", style "height" "100%", style "padding" "40px" ]
            [ Html.form [ onSubmit (PostedMessage model.message) ]
                [ input [ type_ "input", onInput TypedMessage, value model.message, style "width" "100%" ] []
                ]
            ]
        , div []
            [ div [ style "width" "35%", style "background-color" "white", style "margin" "auto", style "height" "100%", style "padding" "40px" ]
                (model.messages
                    |> List.reverse
                    |> List.map (\message -> div [ style "padding" "5px" ] [ viewMessage message ])
                )
            ]
        , br [] []
        ]
    }
