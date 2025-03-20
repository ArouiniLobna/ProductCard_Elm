module ProductCardColorOptions exposing (viewColorOptions)

{-| Color Options Component

This module handles rendering the color option buttons for the product.
Extracting this as a separate component allows for reuse in other contexts
and simplifies testing.
-}

import Html exposing (Html, button, div, text)
import Html.Attributes exposing (attribute, class, title)
import Html.Events exposing (onClick)
import ProductCardTypes exposing (Color)


viewColorOptions : List Color -> Int -> (Int -> msg) -> Html msg
viewColorOptions colors selectedIndex selectColorMsg =
    div 
        [ class "product-card__color-options"
        , attribute "role" "radiogroup"
        , attribute "aria-label" "Available colors"
        ]
        (List.indexedMap (viewColorOption selectedIndex selectColorMsg) colors)


viewColorOption : Int -> (Int -> msg) -> Int -> Color -> Html msg
viewColorOption selectedIndex selectColorMsg index color =
    let
        isSelected =
            selectedIndex == index

        selectedClass =
            if isSelected then
                "product-card__color-option--selected"
            else
                ""
    in
    button
        [ class "product-card__color-option"
        , class selectedClass
        , onClick (selectColorMsg index)
        , attribute "role" "radio"
        , attribute "aria-checked" (if isSelected then "true" else "false")
        , attribute "aria-label" ("Select " ++ color.name ++ " color")
        , title color.name
        ]
        [ div
            [ class "product-card__color-swatch"
            , attribute "style" ("background-color: " ++ color.hex ++ ";")
            ]
            []
        ]