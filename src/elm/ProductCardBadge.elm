module ProductCardBadge exposing (viewBadge)

{-| Badge Component

A simple, reusable badge component that can be used to display
special information (like "New", "Sale", etc.) on a product card.
-}

import Html exposing (Html, div, text)
import Html.Attributes exposing (class)


viewBadge : Maybe String -> Html msg
viewBadge maybeBadgeText =
    case maybeBadgeText of
        Just badgeText ->
            div [ class "product-card__badge" ]
                [ text badgeText ]

        Nothing ->
            text ""