module KeyInput exposing (..)

import Json.Decode as Decode


keyDecoder : (String -> a) -> Decode.Decoder a
keyDecoder f =
    Decode.map f (Decode.field "key" Decode.string)
