library(dplyr)
library(teal.modules.general)
library(teal.modules.clinical)

# Prepare data object
data <- teal_data()
data <- within(data, {
  ADSL <- rADSL
})
join_keys(data) <- default_cdisc_join_keys["ADSL"]


# Prepare module inputs
ADSL <- data[["ADSL"]]

# clinical variables
cs_arm_var <- choices_selected(
  choices = variable_choices(ADSL, subset = c("ARMCD", "ARM")),
  selected = "ARM"
)

# demographic variables
demog_vars_adsl <- ADSL |>
  select(where(is.numeric) | where(is.factor)) |>
  names()


# Create app
app <- init(
  data = data,
  modules = list(
    tm_data_table("Data Table"),
    tm_t_summary(
      label = "Demographic Table",
      dataname = "ADSL",
      
      # this is where it is added
      arm_var = cs_arm_var,
      
      # demographic var
      summarize_vars = choices_selected(
        choices = variable_choices(ADSL, demog_vars_adsl),
        selected = c("SEX", "AGE", "RACE")
      )
    )
  )
)

if (Sys.getenv("QUARTO_ROOT") == "") {
  shinyApp(app$ui, app$server)
}
