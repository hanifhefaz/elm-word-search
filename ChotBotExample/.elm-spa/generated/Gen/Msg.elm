module Gen.Msg exposing (Msg(..))

import Gen.Params.About
import Gen.Params.Chat
import Gen.Params.Contact
import Gen.Params.Models
import Gen.Params.NotFound
import Gen.Params.Top
import Pages.About
import Pages.Chat
import Pages.Contact
import Pages.Models
import Pages.NotFound
import Pages.Top


type Msg
    = About Pages.About.Msg
    | Chat Pages.Chat.Msg
    | Contact Pages.Contact.Msg
    | Models Pages.Models.Msg
    | NotFound Pages.NotFound.Msg
    | Top Pages.Top.Msg

