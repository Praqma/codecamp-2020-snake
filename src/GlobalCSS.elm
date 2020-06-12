module GlobalCSS exposing (..)

import Css exposing (hidden, overflow)
import Css.Global exposing (body, global)
import Html.Styled exposing (toUnstyled)


globalCSS =
    toUnstyled
        (global
            [ body
                [ overflow hidden ]
            ]
        )
