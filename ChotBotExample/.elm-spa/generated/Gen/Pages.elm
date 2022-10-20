module Gen.Pages exposing (Model, Msg, init, subscriptions, update, view)

import Browser.Navigation exposing (Key)
import Effect exposing (Effect)
import ElmSpa.Page
import Gen.Params.About
import Gen.Params.Chat
import Gen.Params.Contact
import Gen.Params.Models
import Gen.Params.NotFound
import Gen.Params.Top
import Gen.Model as Model
import Gen.Msg as Msg
import Gen.Route as Route exposing (Route)
import Page exposing (Page)
import Pages.About
import Pages.Chat
import Pages.Contact
import Pages.Models
import Pages.NotFound
import Pages.Top
import Request exposing (Request)
import Shared
import Task
import Url exposing (Url)
import View exposing (View)


type alias Model =
    Model.Model


type alias Msg =
    Msg.Msg


init : Route -> Shared.Model -> Url -> Key -> ( Model, Effect Msg )
init route =
    case route of
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
    
        Route.Top ->
            pages.top.init ()


update : Msg -> Model -> Shared.Model -> Url -> Key -> ( Model, Effect Msg )
update msg_ model_ =
    case ( msg_, model_ ) of
        ( Msg.About msg, Model.About params model ) ->
            pages.about.update params msg model
    
        ( Msg.Chat msg, Model.Chat params model ) ->
            pages.chat.update params msg model
    
        ( Msg.Contact msg, Model.Contact params model ) ->
            pages.contact.update params msg model
    
        ( Msg.Models msg, Model.Models params model ) ->
            pages.models.update params msg model
    
        ( Msg.NotFound msg, Model.NotFound params model ) ->
            pages.notFound.update params msg model
    
        ( Msg.Top msg, Model.Top params model ) ->
            pages.top.update params msg model

        _ ->
            \_ _ _ -> ( model_, Effect.none )


view : Model -> Shared.Model -> Url -> Key -> View Msg
view model_ =
    case model_ of
        Model.Redirecting_ ->
            \_ _ _ -> View.none
    
        Model.About params model ->
            pages.about.view params model
    
        Model.Chat params model ->
            pages.chat.view params model
    
        Model.Contact params model ->
            pages.contact.view params model
    
        Model.Models params model ->
            pages.models.view params model
    
        Model.NotFound params model ->
            pages.notFound.view params model
    
        Model.Top params model ->
            pages.top.view params model


subscriptions : Model -> Shared.Model -> Url -> Key -> Sub Msg
subscriptions model_ =
    case model_ of
        Model.Redirecting_ ->
            \_ _ _ -> Sub.none
    
        Model.About params model ->
            pages.about.subscriptions params model
    
        Model.Chat params model ->
            pages.chat.subscriptions params model
    
        Model.Contact params model ->
            pages.contact.subscriptions params model
    
        Model.Models params model ->
            pages.models.subscriptions params model
    
        Model.NotFound params model ->
            pages.notFound.subscriptions params model
    
        Model.Top params model ->
            pages.top.subscriptions params model



-- INTERNALS


pages :
    { about : Bundle Gen.Params.About.Params Pages.About.Model Pages.About.Msg
    , chat : Bundle Gen.Params.Chat.Params Pages.Chat.Model Pages.Chat.Msg
    , contact : Bundle Gen.Params.Contact.Params Pages.Contact.Model Pages.Contact.Msg
    , models : Bundle Gen.Params.Models.Params Pages.Models.Model Pages.Models.Msg
    , notFound : Bundle Gen.Params.NotFound.Params Pages.NotFound.Model Pages.NotFound.Msg
    , top : Bundle Gen.Params.Top.Params Pages.Top.Model Pages.Top.Msg
    }
pages =
    { about = bundle Pages.About.page Model.About Msg.About
    , chat = bundle Pages.Chat.page Model.Chat Msg.Chat
    , contact = bundle Pages.Contact.page Model.Contact Msg.Contact
    , models = bundle Pages.Models.page Model.Models Msg.Models
    , notFound = bundle Pages.NotFound.page Model.NotFound Msg.NotFound
    , top = bundle Pages.Top.page Model.Top Msg.Top
    }


type alias Bundle params model msg =
    ElmSpa.Page.Bundle params model msg Shared.Model (Effect Msg) Model Msg (View Msg)


bundle page toModel toMsg =
    ElmSpa.Page.bundle
        { redirecting =
            { model = Model.Redirecting_
            , view = View.none
            }
        , toRoute = Route.fromUrl
        , toUrl = Route.toHref
        , fromCmd = Effect.fromCmd
        , mapEffect = Effect.map toMsg
        , mapView = View.map toMsg
        , toModel = toModel
        , toMsg = toMsg
        , page = page
        }


type alias Static params =
    Bundle params () Never


static : View Never -> (params -> Model) -> Static params
static view_ toModel =
    { init = \params _ _ _ -> ( toModel params, Effect.none )
    , update = \params _ _ _ _ _ -> ( toModel params, Effect.none )
    , view = \_ _ _ _ _ -> View.map never view_
    , subscriptions = \_ _ _ _ _ -> Sub.none
    }
    
