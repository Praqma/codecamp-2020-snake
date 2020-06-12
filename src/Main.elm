module Main exposing (..)

import Browser
import GlobalCSS exposing (globalCSS)
import Html.Attributes as HtmlAttributes
import TypedSvg exposing (svg, line)
import TypedSvg.Attributes exposing (x1, x2, y1,y2, fill)
import TypedSvg.Types exposing (px, Paint(..))
import String exposing (lines)
import Color


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
            [line [x1 (px 100), y1 (px 100), x2 (px 1000), y2 (px 1000), fill (Paint Color.blue) ] []]
        ]
    }


update msg model =
    ( model, Cmd.none )


subscriptions model =
    Sub.none
