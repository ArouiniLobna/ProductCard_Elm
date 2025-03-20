module Tests.ColorOptions exposing (suite)

{-| Tests for the Color Options component
-}

import Expect
import Html.Attributes as Attr
import Json.Encode as Encode
import ProductCardColorOptions exposing (viewColorOptions)
import ProductCard.Types exposing (Color)
import Test exposing (Test, describe, test)
import Test.Html.Event as Event
import Test.Html.Query as Query
import Test.Html.Selector as Selector


suite : Test
suite =
    describe "Color Options Component Tests"
        [ test "renders correct number of color options" <|
            \_ ->
                let
                    colors =
                        [ Color "Red" "#ff0000" "red"
                        , Color "Blue" "#0000ff" "blue"
                        , Color "Green" "#00ff00" "green"
                        ]
                    
                    selectColorMsg =
                        \index -> index
                in
                viewColorOptions colors 0 selectColorMsg
                    |> Query.fromHtml
                    |> Query.findAll [ Selector.class "product-card__color-option" ]
                    |> Query.count (Expect.equal 3)
        
        , test "renders selected color option with correct class" <|
            \_ ->
                let
                    colors =
                        [ Color "Red" "#ff0000" "red"
                        , Color "Blue" "#0000ff" "blue"
                        ]
                    
                    selectedIndex =
                        1
                    
                    selectColorMsg =
                        \index -> index
                in
                viewColorOptions colors selectedIndex selectColorMsg
                    |> Query.fromHtml
                    |> Query.findAll [ Selector.class "product-card__color-option--selected" ]
                    |> Query.count (Expect.equal 1)
        
        , test "clicking a color option sends the correct message" <|
            \_ ->
                let
                    colors =
                        [ Color "Red" "#ff0000" "red"
                        , Color "Blue" "#0000ff" "blue"
                        ]
                    
                    selectColorMsg =
                        \index -> { selectedIndex = index }
                in
                viewColorOptions colors 0 selectColorMsg
                    |> Query.fromHtml
                    |> Query.findAll [ Selector.class "product-card__color-option" ]
                    |> Query.index 1  -- Select the second color option (Blue)
                    |> Event.simulate Event.click
                    |> Event.expect { selectedIndex = 1 }
                    
        , test "color swatches have correct background color styles" <|
            \_ ->
                let
                    colors =
                        [ Color "Red" "#ff0000" "red" ]
                    
                    selectColorMsg =
                        \index -> index
                in
                viewColorOptions colors 0 selectColorMsg
                    |> Query.fromHtml
                    |> Query.find [ Selector.class "product-card__color-swatch" ]
                    |> Query.has [ Selector.attribute (Attr.attribute "style" "background-color: #ff0000;") ]
        
        , test "accessibility attributes are correctly set" <|
            \_ ->
                let
                    colors =
                        [ Color "Red" "#ff0000" "red" ]
                    
                    selectColorMsg =
                        \index -> index
                in
                viewColorOptions colors 0 selectColorMsg
                    |> Query.fromHtml
                    |> Query.find [ Selector.class "product-card__color-options" ]
                    |> Query.has 
                        [ Selector.attribute (Attr.attribute "role" "radiogroup")
                        , Selector.attribute (Attr.attribute "aria-label" "Available colors")
                        ]
        ]