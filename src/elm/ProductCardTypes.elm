module ProductCardTypes exposing (..)

{-| Types for Product Card

This module contains all the type definitions used across the ProductCard components.
Centralizing types helps maintain consistency and makes refactoring easier.
-}


-- PRODUCT TYPES

type alias Product =
    { name : String
    , price : Float
    , colors : List Color
    , images : List ImageAsset
    , slug : String
    , badgeText : Maybe String
    }


type alias Color =
    { name : String
    , hex : String
    , id : String
    }


type alias ImageAsset = 
    { url : String
    , alt : String
    }