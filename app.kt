// kotlin

fun handleSubmit(event: Event) {
  event.preventDefault()
  val formData = FormData(event.target as HTMLFormElement)
  val jsonData = formData.entries().map { entry -> entry.key to entry.value }.toMap()
  val jsonText = Json.encodeToString(JsonObject(jsonData), prettyPrint = true)
  console.log(jsonText)
}
