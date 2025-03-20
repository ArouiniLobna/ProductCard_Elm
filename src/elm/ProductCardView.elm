module ProductCardView exposing (viewProductCard)

{-| View Module for Product Card

This module handles the rendering of the product card and its subcomponents.
Breaking down view logic into smaller functions improves readability and maintenance.
-}
import Html exposing (Html, a, button, div, h3, img, p, span, text)
import Html.Attributes exposing (alt, attribute, class, href, id, src, tabindex, title)
import Html.Events exposing (onClick, onMouseEnter, onMouseLeave)
import ProductCardTypes exposing (Product, Color, ImageAsset)
import ProductCardImage exposing (viewProductImage)
import ProductCardColorOptions exposing (viewColorOptions)


-- MAIN COMPONENT VIEW

viewProductCard : 
    { model 
        | product : Maybe Product
        , isHovering : Bool
        , selectedColorIndex : Int
        , isLoading : Bool
        , error : Maybe String 
    } 
    -> (Int -> msg) -> msg -> msg -> Html msg
viewProductCard model selectColor mouseEnter mouseLeave =
    case model.product of
        Just product ->
            div
                [ class "product-card"
                , attribute "aria-labelledby" "product-title"
                , attribute "role" "article"
                ]
                [ viewProductImage 
                    { product = product
                    , isHovering = model.isHovering
                    , selectedColorIndex = model.selectedColorIndex
                    }
                    mouseEnter
                    mouseLeave
                , viewProductInfo product model.selectedColorIndex selectColor
                ]

        Nothing ->
            if model.isLoading then
                div [ class "product-card product-card--loading" ]
                    [ div [ class "product-card__loading-indicator" ] [] ]
            else
                div [ class "product-card product-card--error" ]
                    [ text "Unable to load product" ]


-- PRODUCT INFO VIEW

viewProductInfo : Product -> Int -> (Int -> msg) -> Html msg
viewProductInfo product selectedColorIndex selectColorMsg =
    div [ class "product-card__info" ]
        [ h3 
            [ class "product-card__title"
            , id "product-title" 
            ]
            [ text product.name ]
        , p [ class "product-card__price" ]
            [ text ("$" ++ String.fromFloat product.price) ]
        , viewColorOptions product.colors selectedColorIndex selectColorMsg
        ]