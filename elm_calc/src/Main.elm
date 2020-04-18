module Main exposing(..)
import String
import Html

check a b = 
  String.left 1 a == String.left 1 b




main =
  Html.text (check "vasile" "ion")
