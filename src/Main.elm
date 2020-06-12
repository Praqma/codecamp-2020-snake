module Main exposing (..)

import Browser exposing (Document)
import Color
import GlobalCSS exposing (globalCSS)
import Html.Attributes as HtmlAttributes
import String exposing (lines)
import TypedSvg exposing (..)
import TypedSvg.Attributes as Attr exposing (..)
import TypedSvg.Types exposing (Paint(..), px)


type alias Model =
    { apple :
        { x : Float
        , y : Float
        }
    }


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
    ( { apple = { x = 4, y = 1 } }
    , Cmd.none
    )


tileSize =
    100


view { apple } =
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
            [ snakePart { x = 1, y = 1 }
            , appleShape apple
            ]
        ]
    }


snakePart { x, y } =
    rect
        [ Attr.x (px (x * tileSize))
        , Attr.y (px (y * tileSize))
        , width (px tileSize)
        , height (px tileSize)
        , stroke (Paint Color.green)
        , fill (Paint Color.green)
        ]
        []


appleShape { x, y } =
    circle
        [ cx (px (x * tileSize + (tileSize / 2)))
        , cy (px (y * tileSize + (tileSize / 2)))
        , r (px (tileSize / 2))
        , stroke (Paint Color.red)
        , fill (Paint Color.red)
        ]
        []


update msg model =
    ( model, Cmd.none )


subscriptions model =
    Sub.none
