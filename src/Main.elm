module Main exposing (..)

import Browser
import Html exposing (..)


type alias Model =
    ()


type alias Msg =
    Never


main =
    Browser.document
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }


init : () -> ( Model, Cmd Msg )
init flags =
    ( (), Cmd.none )


view model =
    { title = "Hello World!"
    , body = [ text "Hello World!" ]
    }


update msg model =
    ( model, Cmd.none )


subscriptions model =
    Sub.none
