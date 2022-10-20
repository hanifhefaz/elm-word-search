module Pages.Contact exposing (Params, Model, Msg, page)

import Html exposing (..)
import Spa.Document exposing (Document)
import Spa.Page as Page exposing (Page)
import Spa.Url exposing (Url)
import Html.Attributes exposing (..)


page : Page Params Model Msg
page =
    Page.static
        { view = view
        }


type alias Model =
    Url Params


type alias Msg =
    Never



-- VIEW


type alias Params =
    ()


view : Url Params -> Document Msg
view { params } =
    { title = "About"
    , body = [ div [ class "row py-5" ]
            [ div [ class "col-lg-12 mx-auto" ]
                [ div [ class "text-white p-5 shadow-sm rounded banner" ]
                    [ h1 [ class "display-4" ]
                        [ text "Contact Us" ]
                    , p [ class "lead" ]
                        [ text "Do you have any question, regarding our products?" ]
                        , div [ style "text-align" "center" ][]

                ]
                , br[][]
                , p [ class "display-8", style "text-align" "center" ]
                        [ text "You can contact us only in case, if our agent did not answered your questions. Please use our built in model in the website, by clicking in the chat menu at the top right of the navbar. If your question was not answered there, then you can contact us via email or phone. Please note that you can ask anything to our agent. He is smart, and will try to answer your quesiont as soon as possible." ]
            ]

            ]
    ]
    }
