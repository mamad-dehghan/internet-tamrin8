-- Elm

import Html.Events exposing (submit)
import Json.Encode exposing (encode, indent)
import FormData

{-  takes an EventTarget and FormData as arguments, and logs the JSON-encoded version of the form data to the console after preventing default submission behavior  -}
handleSubmit : FormData -> String
handleSubmit formData =
    let
        jsonData =
            FormData.toJsonObject formData

        jsonText =
            jsonData
                |> encode 2
                |> indent 2
    in
    jsonText

--The view function returns an HTML form containing two input fields for name and email with default values "Mamad Dehghan" and "mamad-dehghan@domain.com", and a submit button that triggers the handleSubmit function when clicked. Additionally, the function renders a pre-existing HTML element displaying the current form data as a string.
view : Html msg
view =
    let
        form =
            Html.form [ submit handleSubmit ] []

        pre =
            Html.pre [] []
    in
    Html.div []
        [ form
            [ Html.fieldset []
                [ Html.legend [] [ Html.text "Form Data" ]
                , Html.input [ Html.Attributes.type_ "text", Html.Attributes.name "name", Html.Attributes.value "John Doe" ] []
                , Html.input [ Html.Attributes.type_ "email", Html.Attributes.name "email", Html.Attributes.value "johndoe@example.com" ] []
                ]
            ]
        , pre [ Html.text <| handleSubmit <| FormData.fromList [ ("name", "Damad Dehghan"), ("email", "mamad-dehghan@domain.com") ] ]
        ]
