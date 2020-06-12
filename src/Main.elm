module Main exposing (..)

import Browser
import GlobalCSS exposing (globalCSS)
import Html.Attributes as HtmlAttributes
import TypedSvg exposing (svg)


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
    , body =
        [ globalCSS
        , svg
            [ HtmlAttributes.style
                "width"
                "100vw"
            , HtmlAttributes.style
                "height"
                "100vh"
            ]
            []
        ]
    }


update msg model =
    ( model, Cmd.none )


subscriptions model =
    Sub.none
