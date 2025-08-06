# load teal and all dependent packages
library(teal)

# create empty `teal_data` object
data <- teal_data()

# execute code within it
data <- within(data, {
  ADAE <- teal.data::rADAE # adverse events
  ADSL <- teal.data::rADSL # patient listing
})


# app starts here -----
# app <- init(
#   data = data,
#   modules = list(
#     example_module()
#   )
# )
# # ?modify_title
# # modify_title(app, "Test teal")
# modify_header(app, h3("Test teal 2"))  
#   # # this is the header
#   # modify_header(h3("Test teal 2")) |>
#   # modify_footer(tags$div(a("Powered by teal", href = "https://insightsengineering.github.io/teal/latest-tag/")))



app <- init(
  data = data,
  modules = list(
    example_module()
  )
) |>
  modify_title("My new title") |>
  modify_header("My new header") |>
  modify_footer("My new footer")

if (Sys.getenv("QUARTO_ROOT") == "") {
  shinyApp(app$ui, app$server)
}
