module Spa.Generated.Pages exposing
    ( Model
    , Msg
    , init
    , load
    , save
    , subscriptions
    , update
    , view
    )

import Pages.Top
import Pages.About
import Pages.Chat
import Pages.Contact
import Pages.Models
import Pages.NotFound
import Shared
import Spa.Document as Document exposing (Document)
import Spa.Generated.Route as Route exposing (Route)
import Spa.Page exposing (Page)
import Spa.Url as Url


-- TYPES


type Model
    = Top__Model Pages.Top.Model
    | About__Model Pages.About.Model
    | Chat__Model Pages.Chat.Model
    | Contact__Model Pages.Contact.Model
    | Models__Model Pages.Models.Model
    | NotFound__Model Pages.NotFound.Model


type Msg
    = Top__Msg Pages.Top.Msg
    | About__Msg Pages.About.Msg
    | Chat__Msg Pages.Chat.Msg
    | Contact__Msg Pages.Contact.Msg
    | Models__Msg Pages.Models.Msg
    | NotFound__Msg Pages.NotFound.Msg



-- INIT


init : Route -> Shared.Model -> ( Model, Cmd Msg )
init route =
    case route of
        Route.Top ->
            pages.top.init ()
        
        Route.About ->
            pages.about.init ()
        
        Route.Chat ->
            pages.chat.init ()
        
        Route.Contact ->
            pages.contact.init ()
        
        Route.Models ->
            pages.models.init ()
        
        Route.NotFound ->
            pages.notFound.init ()



-- UPDATE


update : Msg -> Model -> ( Model, Cmd Msg )
update bigMsg bigModel =
    case ( bigMsg, bigModel ) of
        ( Top__Msg msg, Top__Model model ) ->
            pages.top.update msg model
        
        ( About__Msg msg, About__Model model ) ->
            pages.about.update msg model
        
        ( Chat__Msg msg, Chat__Model model ) ->
            pages.chat.update msg model
        
        ( Contact__Msg msg, Contact__Model model ) ->
            pages.contact.update msg model
        
        ( Models__Msg msg, Models__Model model ) ->
            pages.models.update msg model
        
        ( NotFound__Msg msg, NotFound__Model model ) ->
            pages.notFound.update msg model
        
        _ ->
            ( bigModel, Cmd.none )



-- BUNDLE - (view + subscriptions)


bundle : Model -> Bundle
bundle bigModel =
    case bigModel of
        Top__Model model ->
            pages.top.bundle model
        
        About__Model model ->
            pages.about.bundle model
        
        Chat__Model model ->
            pages.chat.bundle model
        
        Contact__Model model ->
            pages.contact.bundle model
        
        Models__Model model ->
            pages.models.bundle model
        
        NotFound__Model model ->
            pages.notFound.bundle model


view : Model -> Document Msg
view model =
    (bundle model).view ()


subscriptions : Model -> Sub Msg
subscriptions model =
    (bundle model).subscriptions ()


save : Model -> Shared.Model -> Shared.Model
save model =
    (bundle model).save ()


load : Model -> Shared.Model -> ( Model, Cmd Msg )
load model =
    (bundle model).load ()



-- UPGRADING PAGES


type alias Upgraded params model msg =
    { init : params -> Shared.Model -> ( Model, Cmd Msg )
    , update : msg -> model -> ( Model, Cmd Msg )
    , bundle : model -> Bundle
    }


type alias Bundle =
    { view : () -> Document Msg
    , subscriptions : () -> Sub Msg
    , save : () -> Shared.Model -> Shared.Model
    , load : () -> Shared.Model -> ( Model, Cmd Msg )
    }


upgrade : (model -> Model) -> (msg -> Msg) -> Page params model msg -> Upgraded params model msg
upgrade toModel toMsg page =
    let
        init_ params shared =
            page.init shared (Url.create params shared.key shared.url) |> Tuple.mapBoth toModel (Cmd.map toMsg)

        update_ msg model =
            page.update msg model |> Tuple.mapBoth toModel (Cmd.map toMsg)

        bundle_ model =
            { view = \_ -> page.view model |> Document.map toMsg
            , subscriptions = \_ -> page.subscriptions model |> Sub.map toMsg
            , save = \_ -> page.save model
            , load = \_ -> load_ model
            }

        load_ model shared =
            page.load shared model |> Tuple.mapBoth toModel (Cmd.map toMsg)
    in
    { init = init_
    , update = update_
    , bundle = bundle_
    }


pages :
    { top : Upgraded Pages.Top.Params Pages.Top.Model Pages.Top.Msg
    , about : Upgraded Pages.About.Params Pages.About.Model Pages.About.Msg
    , chat : Upgraded Pages.Chat.Params Pages.Chat.Model Pages.Chat.Msg
    , contact : Upgraded Pages.Contact.Params Pages.Contact.Model Pages.Contact.Msg
    , models : Upgraded Pages.Models.Params Pages.Models.Model Pages.Models.Msg
    , notFound : Upgraded Pages.NotFound.Params Pages.NotFound.Model Pages.NotFound.Msg
    }
pages =
    { top = Pages.Top.page |> upgrade Top__Model Top__Msg
    , about = Pages.About.page |> upgrade About__Model About__Msg
    , chat = Pages.Chat.page |> upgrade Chat__Model Chat__Msg
    , contact = Pages.Contact.page |> upgrade Contact__Model Contact__Msg
    , models = Pages.Models.page |> upgrade Models__Model Models__Msg
    , notFound = Pages.NotFound.page |> upgrade NotFound__Model NotFound__Msg
    }