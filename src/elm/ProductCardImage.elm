module ProductCardImage exposing (viewProductImage)

{-| Product Image Component

This module is responsible for rendering the product image with proper hover effects
and optional badge. It's extracted as a separate component for better reusability.
-}

import Html exposing (Html, a, div, img, text)
import Html.Attributes exposing (alt, attribute, class, href, src)
import Html.Events exposing (onMouseEnter, onMouseLeave)
import ProductCardTypes exposing (Product, Color, ImageAsset)
import ProductCardBadge exposing (viewBadge)


viewProductImage : 
    { product : Product
    , isHovering : Bool
    , selectedColorIndex : Int
    } 
    -> msg  -- mouseEnter message
    -> msg  -- mouseLeave message
    -> Html msg
viewProductImage config mouseEnter mouseLeave =
    let
        selectedColor =
            List.drop config.selectedColorIndex config.product.colors
                |> List.head
                |> Maybe.withDefault (Color "Default" "#000000" "default")
                
        selectedImage =
            List.drop config.selectedColorIndex config.product.images
                |> List.head
                |> Maybe.withDefault (ImageAsset "/default-image.jpg" "Product image")
                
        hoverClass =
            if config.isHovering then
                "product-card__image-container--hover"
            else
                ""
                
        productUrl =
            "/products/" ++ config.product.slug
    in
    a
        [ href productUrl
        , class "product-card__image-container"
        , class hoverClass
        , onMouseEnter mouseEnter
        , onMouseLeave mouseLeave
        ]
        [ viewBadge config.product.badgeText
        , img
            [ src selectedImage.url
            , alt selectedImage.alt
            , class "product-card__image"
            , attribute "loading" "lazy"
            ] []
        ]