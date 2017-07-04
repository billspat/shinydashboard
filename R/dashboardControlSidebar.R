#' create HTML for a control-sidebar per AdminLTE theme for use on the dashboard
#' sidebar is an aside and included in the page
#' currently also requires a toggle switch in the dashboardHeader(controlsidebar = TRUE)
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

recentActivityExampleList <- function(){
  HTML('
      <h3 class="control-sidebar-heading">Recent Activity</h3>
      <ul class="control-sidebar-menu">
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
