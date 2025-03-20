module ProductCardApi exposing (fetchProductData, productDecoder)

{-| API Module for Product Card

This module handles all API-related functionality including HTTP requests and decoders.
Separating API logic from view and state management makes the code more maintainable.
-}

import Http
import Json.Decode as Decode exposing (Decoder, field, string, float, list, maybe)
import ProductCardTypes exposing (Product, Color, ImageAsset)


-- HTTP

fetchProductData : (Result Http.Error Product -> msg) -> Cmd msg
fetchProductData productMsg =
    -- In a real application, this would fetch from your API
    -- Here we're simulating the API call
    Http.get
        { url = "/api/product/example.json"
        , expect = Http.expectJson productMsg productDecoder
        }


-- DECODERS

productDecoder : Decoder Product
productDecoder =
    Decode.map6 Product
        (field "name" string)
        (field "price" float)
        (field "colors" (list colorDecoder))
        (field "images" (list imageDecoder))
        (field "slug" string)
        (field "badgeText" (maybe string))


colorDecoder : Decoder Color
colorDecoder =
    Decode.map3 Color
        (field "name" string)
        (field "hex" string)
        (field "id" string)


imageDecoder : Decoder ImageAsset
imageDecoder =
    Decode.map2 ImageAsset
        (field "url" string)
        (field "alt" string)