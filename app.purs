-- pureScript

module Main where

import Prelude

import Effect.Console (log)

import Data.Argonaut.Core (jsonEncode)
import Data.FormData (FormData, fromEventTarget)
import Web.Event.EventTarget (EventTarget)
import Web.HTML (form_, input_)
import Web.HTML.Types (HTMLFormElement)
import Web.HTML.HTMLFormElement (formElements)
import Web.HTML.HTMLInputElement (value)

handleSubmit :: EventTarget -> FormData -> Effect Unit
handleSubmit target formData = do
  _ <- preventDefault target
  let jsonData = fromEventTarget formData
      jsonText = jsonEncode 2 jsonData
  log jsonText

--this function takes four HTMLFormElement arguments representing the nameInput, emailInput, form, and pre elements on the HTML page. It creates a form element with the two input fields and attaches an onSubmit event listener that triggers the handleSubmit
--The pre_ element is used to display the JSON-encoded form data in a preformatted text.
view :: HTMLFormElement -> HTMLFormElement -> HTMLFormElement -> HTMLFormElement -> HTMLElement
view nameInput emailInput form pre = form_ [onSubmit $ handleSubmit form] [
    input_ [type_ "text", name_ "name", value_ "Mamad Dehghan"] [],
    input_ [type_ "email", name_ "email", value_ "mamad-dehghan@domain.com"] []
  ],
  pre_ [] [text $ show <| fromEventTarget <| fromList [("name", "Mamad Dehghan"), ("email", "mamad-dehghan@domain.com")]]
