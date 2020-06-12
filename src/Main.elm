module Main exposing (..)

import Browser exposing (Document)
import Browser.Events exposing (onKeyDown)
import Color
import GlobalCSS exposing (globalCSS)
import Html.Attributes as HtmlAttributes
import KeyInput exposing (keyDecoder)
import String exposing (lines)
import Time exposing (every)
import TypedSvg exposing (..)
import TypedSvg.Attributes as Attr exposing (..)
import TypedSvg.Types exposing (Paint(..), px)


type alias Model =
    { apple :
        { x : Float
        , y : Float
        }
    , snake :
        List
            { x : Float
            , y : Float
            }
    , direction : Direction
    }


type Direction
    = StateUp
    | StateDown
    | StateLeft
    | StateRight


type Msg
    = Up
    | Down
    | Right
    | Left
    | Continue
    | Move


main =
    Browser.document
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }


init : () -> ( Model, Cmd Msg )
init flags =
    ( { apple = { x = 4, y = 1 }
      , snake =
            [ { x = 1, y = 1 }
            , { x = 1, y = 2 }
            ]
      , direction = StateRight
      }
    , Cmd.none
    )


tileSize =
    100


speedUp =
    1000


view { apple, snake } =
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
            (List.map snakePart snake
                ++ [ appleShape apple ]
            )
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
    case msg of
        Continue ->
            ( model, Cmd.none )

        Up ->
            ( { model | direction = StateUp }, Cmd.none )

        Down ->
            ( { model | direction = StateDown }, Cmd.none )

        Right ->
            ( { model | direction = StateRight }
            , Cmd.none
            )

        Left ->
            ( { model | direction = StateLeft }, Cmd.none )

        Move ->
            case model.direction of
                StateUp ->
                    case model.snake of
                        [] ->
                            ( model, Cmd.none )

                        head :: tail ->
                            ( { model | snake = tail }, Cmd.none )

                StateDown ->
                    ( model, Cmd.none )

                StateLeft ->
                    ( model, Cmd.none )

                StateRight ->
                    ( model, Cmd.none )


subscriptions model =
    Sub.batch
        [ onKeyDown (keyDecoder keyToMessage)
        , every speedUp (always Move)
        ]


keyToMessage string =
    case string of
        "ArrowUp" ->
            Up

        "ArrowDown" ->
            Down

        "ArrowLeft" ->
            Left

        "ArrowRight" ->
            Right

        _ ->
            Continue
