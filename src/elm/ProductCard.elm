-- Main Product Card Module
module ProductCard exposing (Model, Msg, init, update, view)

{-| Product Card Component

This module implements a product card component similar to those found on bellroy.com.
It showcases clean, maintainable Elm code with proper type definitions,
responsive design, and accessibility features(can tab and select colors using keyboards ONLY, also the screen reader, can read out selected and unselected options).

This version has been refactored into smaller, more reusable components.
-}

import Html exposing (Html)
import Http
import ProductCardTypes exposing (..)
import ProductCardApi exposing (fetchProductData)
import ProductCardView exposing (viewProductCard)


-- MODEL


type alias Model =
    { product : Maybe Product
    , isHovering : Bool
    , selectedColorIndex : Int
    , isLoading : Bool
    , error : Maybe String
    }


-- INIT

init : () -> ( Model, Cmd Msg )
init _ =
    ( { product = Nothing
      , isHovering = False
      , selectedColorIndex = 0
      , isLoading = True
      , error = Nothing
      }
    , fetchProductData ProductReceived
    )


-- UPDATE

type Msg
    = ProductReceived (Result Http.Error Product)
    | MouseEnter
    | MouseLeave
    | SelectColor Int


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        ProductReceived result ->
            case result of
                Ok product ->
                    ( { model | product = Just product, isLoading = False }, Cmd.none )

                Err _ ->
                    ( { model | error = Just "Failed to load product data", isLoading = False }, Cmd.none )

        MouseEnter ->
            ( { model | isHovering = True }, Cmd.none )

        MouseLeave ->
            ( { model | isHovering = False }, Cmd.none )

        SelectColor index ->
            ( { model | selectedColorIndex = index }, Cmd.none )


-- VIEW

view : Model -> Html Msg
view model =
    viewProductCard model SelectColor MouseEnter MouseLeave