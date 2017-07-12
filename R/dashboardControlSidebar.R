
#' create HTML for a control-sidebar per AdminLTE theme for use on the dashboard
#' sidebar is an aside and included in the page
#'
#' to see this menu, it also requires a toggle switch in the dashboardHeader, enabled with
#' parameter (controlsidebar = TRUE)
#' This sidebar should contain items of r
#' @param ... list of items to include on the sidebar
#'
#' @export
dashboardControlSidebar <- function(...){
   tags$aside(class="control-sidebar control-sidebar-dark",
      ...
    )
}



#' create a UL list with sidebar menu class to go inside \code{\link{dashboardControlSidebar}}
#' @param ... list of items to go into the menu, each an <li> element
#'    or controlsidebarMenuItem()
#' @param headerText if preseent display header prior to showing items.  The AdminLTE theme has a large
#'    space for this to it's recommend to include a heading
#' @param .list useful for building dynamic parameters
#' @export
controlsidebarMenu <- function(..., headerText=NULL, .list=NULL){
  items <- c(list(...), .list)
  # this ensures the elements sent all start with 'li'
  # but it's not recognizing as shiny.tags (to nests lists? ) so disabled for now
  # lapply(items, tagAssert, type = "li")

  # note that in adminlte, the control sidebar has tabs and tab content
  # here there is no tabs, just a single tab content div to maintain the style
  div(class="tab-content",
      div(class="tab-pane active", id="control-sidebar-only-tab",
          if (!is.null(headerText)){
              h3(class="control-sidebar-heading", headerText)
          },
          tags$ul(class="control-sidebar-menu",
              items
          )
      )
    )
}


#' create items to go into controlsidebar menu
#' this is a simplified version from what is in the AdminLTE theme: no icon, and simply
#' a header and any number of basic items below it (p, lists, small tables, etc)
#' @param ... items in the body of the menu item (encased in a and then a div)
#' @param href value of the href attribute of the encasing a tag.  could be a url, default #
#' @param headerText An optional text argument used for the header of the item
#' @param .list  An optional list containing items to put in the menu Same as the
#'   \code{...} arguments, but in list format. This can be useful when working
#'   with programmatically generated items.
#' @export
controlsidebarMenuItem <- function(...,  href = NULL, headerText=NA, .list=NULL){
  if (is.null(href)) href <- "#"
  items <- c(list(...), .list)
  tags$li(
    tags$a(href=href,
        div(class="",
          if(!is.na(headerText)){tags$h4(class="control-sidebar-subheading", headerText)},
          items
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
