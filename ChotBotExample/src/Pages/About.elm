module Pages.About exposing (Params, Model, Msg, page)

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
                        [ text "About Us" ]
                    , p [ class "lead" ]
                        [ text "Do you have any question, regarding our products?" ]
                        , div [ style "text-align" "center" ][]

                ]
                , br[][]
                , p [ class "display-8", style "text-align" "center" ]
                        [ text "E-asy is an online shopping system, where you can buy different things. If you have any questions regarding our products or services, we highly recommend to chat to our agent."]
            ]
            ]
    ]
    }
