module Main exposing (main)

{-| Example of how to use the refactored ProductCard component

This demonstrates how to integrate the ProductCard component into a larger application.
-}

import Browser
import Html exposing (Html, div, h1, text)
import Html.Attributes exposing (class)
import ProductCard


-- MAIN

main : Program () Model Msg
main =
    Browser.element
        { init = init
        , update = update
        , subscriptions = subscriptions
        , view = view
        }


-- MODEL

type alias Model =
    { productCardModel : ProductCard.Model
    }


init : () -> ( Model, Cmd Msg )
init flags =
    let
        ( productCardModel, productCardCmd ) =
            ProductCard.init ()
    in
    ( { productCardModel = productCardModel }
    , Cmd.map ProductCardMsg productCardCmd
    )


-- UPDATE

type Msg
    = ProductCardMsg ProductCard.Msg


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        ProductCardMsg subMsg ->
            let
                ( updatedProductCardModel, productCardCmd ) =
                    ProductCard.update subMsg model.productCardModel
            in
            ( { model | productCardModel = updatedProductCardModel }
            , Cmd.map ProductCardMsg productCardCmd
            )


-- SUBSCRIPTIONS

subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none


-- VIEW

view : Model -> Html Msg
view model =
    div [ class "app-container" ]
        [ h1 [] [ text "Featured Products" ]
        , div [ class "products-grid" ]
            [ Html.map ProductCardMsg (ProductCard.view model.productCardModel)
            -- You could add more product cards here
            ]
        ]