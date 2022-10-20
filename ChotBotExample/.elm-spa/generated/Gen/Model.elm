module Gen.Model exposing (Model(..))

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


type Model
    = Redirecting_
    | About Gen.Params.About.Params Pages.About.Model
    | Chat Gen.Params.Chat.Params Pages.Chat.Model
    | Contact Gen.Params.Contact.Params Pages.Contact.Model
    | Models Gen.Params.Models.Params Pages.Models.Model
    | NotFound Gen.Params.NotFound.Params Pages.NotFound.Model
    | Top Gen.Params.Top.Params Pages.Top.Model

