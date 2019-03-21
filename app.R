library(shinydashboard)
header <- dashboardHeader(dropdownMenu(
  type = "messages",
  messageItem(
    from = "Lucy",
    message = "You can view the International Space Station!",
    href = "https://spotthestation.nasa.gov/sightings/"
  ),
  # Add a second messageItem() 
  messageItem(
    from = "Sarah",
    message = "Learn more about the International Space Station", 
    href = "https://spotthestation.nasa.gov/faq.cfm")
)
)
sidebar <- dashboardSidebar(
  sidebarMenu(
    # Create two `menuItem()`s, "Dashboard" and "Inputs"
    menuItem(
      tabName = "dashboard", 
      text = "Dashboard"), 
    
    menuItem(
      tabName = "inputs", 
      text = "Inputs"),
    
    sliderInput(
      inputId = "height",
      label = "Height",
      min = 66,
      max = 264,
      value = 264)
  )
)
body <- dashboardBody()

# Create the UI using the header, sidebar, and body
ui <- dashboardPage(header = header,
                    sidebar = sidebar,
                    body = body)

server <- function(input, output, session) {
  load("touristcountryorigin.xlsx")
  tourist_origin <- touristcountryorigin[touristcountryorigin$value = input$value]
  hist(touristcountryorigin$value)
}

shinyApp(ui, server)