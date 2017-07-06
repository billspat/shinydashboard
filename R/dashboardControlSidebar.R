
#' create HTML for a control-sidebar per AdminLTE theme for use on the dashboard
#' sidebar is an aside and included in the page
#'
#' to see this menu, it also requires a toggle switch in the dashboardHeader, enabled with
#' parameter (controlsidebar = TRUE)
#' @param ... list of items to include on the sidebar
#'
#' @export
dashboardControlSidebar <- function(...){
   tags$aside(class="control-sidebar control-sidebar-dark",
      ...
    )
}



controlSidebarContent <- function(){
  div(class="tab-pane active", id="control-sidebar-settings-tab",
    # <form method="post">
    h3(class="control-sidebar-heading", HTML('General Settings')),

    div(class="form-group",
      HTML('<label class="control-sidebar-subheading">
      Report panel usage
      <input type="checkbox" class="pull-right" checked="">
      </label>'),
      p("Some information about this general settings option"),
      p('Other sets of options are available')
    ),

  h3(class="control-sidebar-heading", 'Second Heading')
  )
}

#' create a UL list with sidebar menu class
#' @param ... list of items to go into the menu, each an <li> element
#'    or controlsidebarMenuItem()
#' @export
controlsidebarMenu <- function(..., heading=NULL){
  if (is.null(heading)){
    heading = "Control Menu"
  }


  items = list(...)
  lapply(items, tagAssert, type = "li")

  # note that in adminlte, the control sidebar has tabs and tab content
  # here there is no tabs, just a single tab content div to maintain the style
  div(class="tab-content",
      div(class="tab-pane active", id="control-sidebar-only-tab",
          h3(class="control-sidebar-heading", heading),
          tags$ul(class="control-sidebar-menu",
              items
              )
      )
    )
}


#' create items to go into controlsidebar
#' @param text text inside <p> element
#' @export
controlsidebarMenuItem <- function(text, icon = shiny::icon("code"),  href = NULL, heading=NA ){
  tagAssert(icon, type = "i")
  if (is.null(href)) href <- "#"
  tags$li(
    tags$a(href=href, icon,
        div(class="menu-info",
          if(!is.na(heading)){tags$h4(class="control-sidebar-subheading", heading)},
          p(text)
        )
    )
  )
}

recentActivityExampleList <- function(){
  HTML('
      <h3 class="control-sidebar-heading">Recent Activity</h3>
      <ul >
           <li>
           <a href="javascript:void(0)">
           <i class="menu-icon fa fa-user bg-yellow"></i>

           <div class="menu-info">
           <h4 class="control-sidebar-subheading">Frodo Updated His Profile</h4>

           <p>New phone +1(800)555-1234</p>
           </div>
           </a>
           </li>
           <li>
           <a href="javascript:void(0)">
           <i class="menu-icon fa fa-envelope-o bg-light-blue"></i>

           <div class="menu-info">
           <h4 class="control-sidebar-subheading">Nora Joined Mailing List</h4>

           <p>nora@example.com</p>
           </div>
           </a>
           </li>
           <li>
           <a href="javascript:void(0)">
           <i class="menu-icon fa fa-file-code-o bg-green"></i>

           <div class="menu-info">
           <h4 class="control-sidebar-subheading">Cron Job 254 Executed</h4>

           <p>Execution time 5 seconds</p>
           </div>
           </a>
           </li>
       </ul>')
}

### sidebar tabs as in ADMINLTE theme
#<ul class="nav nav-tabs nav-justified control-sidebar-tabs">
#   <li class="active"><a href="#control-sidebar-theme-demo-options-tab" data-toggle="tab"><i class="fa fa-wrench"></i></a></li><li><a href="#control-sidebar-home-tab" data-toggle="tab"><i class="fa fa-home"></i></a></li>
#   <li><a href="#control-sidebar-settings-tab" data-toggle="tab"><i class="fa fa-gears"></i></a></li>
# </ul>


