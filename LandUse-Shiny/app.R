#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#
# LAND USE PROJECT APP

install.packages(c('shiny', 'dplyer', 'shinycssloaders', 'shinythemes', 'stingr', 'shinyjs', 'ggplot2', 'plotly', 'rsconnect'))

library(shiny)
library(dplyr)
library(shinycssloaders)
library(shinythemes)
library(stringr)
library(shinyjs)
library(ggplot2)
library(plotly)
library(rsconnect)

# data --------------------------------------------------------------------------------------------------------------------

# powhatan parcel data

pow_parcel_data <- 

ui <- navbarPage(title = "DSPG 2022",
                 selected = "overview",
                 theme = shinytheme("lumen"),
                 tags$head(tags$style('.selectize-dropdown {z-index: 10000}')), 
                 useShinyjs(),
                 
                 ## Tab Overview--------------------------------------------
                 tabPanel("Overview", value = "overview",
                          fluidRow(style = "margin: 2px;",
                                   align = "center",
                                   br(""),
                                   h1(strong("Land Use in Rural Counties on the Urban Fringe: the case of Goochland and Powhatan Counties​"),
                                      br(""),
                                      h4("Data Science for the Public Good Program"),
                                      h4("Virginia Tech"),
                                      br()
                                   )
                          ),
                          fluidRow(style = "margin: 6px;",
                                   column(4,
                                          h2(strong("Project Background")),
                                          p(strong("The setting:"), "Powhatan and Goochland County are two counties on the urban fringe outside of Richmond, Virginia. Both counties are known for their 
                                            rich agricultural histories.  Although Powhatan County has been growing and devolving faster than the average rate, they like Goochland County would like to 
                                            keep their agricultural roots.  "),
                                          p(),
                                          p(strong("The problem:"), "Powhatan and Goochland are both rural counties, but they both are located close to Richmond. Being that close to a big city like 
                                            Richmond has its advantages, but also its drawbacks. One of the biggest drawbacks is land conversion. Land conversion is when land shifts its use from one 
                                            use to another. In the case of Powhatan and Goochland, it means land is changing from agricultural land to residential. This really could hurt the economies 
                                            of the mostly agricultural counties. Both counties have enacted policies to help combat land conversion. Powhatan with its land tax deferral and Goochland with 
                                            its eighty-five- fifteen comprehensive plan. Both counties keep administrative data, but do not have the resources or the knowledge to analyze the data. This 
                                            is a key step in understanding the factors that cause land conversation or the probability that a parcel of land will convert. "),
                                          p(),
                                          p(strong("The project:"), "This Virginia Tech", a(href = "https://aaec.vt.edu/index.html", "Department of Argicultural and Applied Economics", target = "_blank"),
                                            "Data Science for Public Good (DSPG) project aims to leverage data science to provide an estimation of the water resources and the quality 
                                       issues they face in the county in order to design better management strategies for industrial and residential growth.")
                                   ),
                                   column(4,
                                          h2(strong("Our Work")),
                                          p("Our research team worked with Powhatan County and Goochland County to help find a way to minimize land conversion. Both counties want to stay mostly agricultural even going as far to introduce 
                                            policies including Powhatan’s land use tax deferral program and Goochland’s eighty-five- fifteen comprehensive plan. Our research team studied background information and past reports to get an 
                                            understanding and feel for the project and the data we would be analyzing. The team also meet with their stakeholders on a regular basic to make sure the project was finished on schedule and 
                                            that it pleased the stakeholders.  In addition to the meetings with the stakeholders, there was also contact by email to answer any questions pertaining to the project. "),
                                          p(),
                                          p("We collected all of our data from the ACS and county level administrative data to create our graphs, maps, and tables. These visualizations allowed us to analyze and present our findings timely and accurately. We:"),
                                          tags$li("Provided census tract and county-level maps of Goochland and Powhatan County residents'", strong("sociodemographic and socioeconomic characteristics,"), " highlighting underprivileged areas."),
                                          tags$li("Used crop layer data to create a map of", strong("all crops grown (and acreage)"), "in the counties. "),
                                          tags$li("Mapped locations of", strong("land parcels"), "at census block group level to highlight the surface water sources and the potential contaminations sources in the county.  "),
                                          tags$li("Mapped traffic data to show ", strong("commute times"), "to Richmond, Virginia from both counties."),
                                          tags$li("Created a", strong("Multinomial Logistic regression model"), "to show probability of land conversion. "), 
                                          p(),
                                          p("This dashboard compiles our findings and allows extension professionals, stakeholders, and other users to explore the information interactively."),
                                   ),
                                   column(4,
                                          h2(strong("Dashboard Aims")),
                                          p("Our dashboard is aimed at:"),
                                          p(strong("Powhatan and Goochland county’s government."), "This dashboard will show them the probability of a land parcel converting and the factors 
                                            that make them convert. These factors will help make more policies to combat land conversion. "),
                                          p(strong("Researchers working on land use conversion."), "Land conversion is a problem all over the country not just Powhatan and Goochland counties. 
                                            Those could use our dashboard as an idea on how to show their findings and what data to use to calculate the probability of land use conversion.")
                                   )
                          ),
                          fluidRow(align = "center",
                                   p(tags$small(em('Last updated: August 2022')))
                          ) 
                 ),
                 
                 ## Tab Geology--------------------------------------------
                 # need a different name
                 navbarMenu("Sociodemographics" , 
                            tabPanel("Goochland", 
                                     fluidRow(style = "margin: 6px;",
                                              h1(strong("Goochland"), align = "center"),
                                              p("", style = "padding-top:10px;"), 
                                              column(4, 
                                                     h4(strong("County Background")),
                                                     p("Goochland County is located in the Piedmont of the Commonwealth of Virginia. It covers 281.42 square miles. This makes Goochland the 71st biggest
                                                       county in Virginia. The country is known for its fertile land and mineral deposits. The James River flows through the center of county which
                                                       supplied water to farmlands and to mills. In the east side of the county coal was mined and in the west gold.  Today, agriculture is still 
                                                       important to the county economy. Goochland has updated its voting districts in 2022 to better represent the population of all 5 districts. 
                                                       Goochland Country also has a huge summer program with plenty of activates. The activates are located all over the county at different facilities 
                                                       including the skate park, gymnasium, the baseball fields, weight room, trails, and many more. "),
                                                     
                                                     h4(strong("Summary Statistics")),
                                                     p("Goochland County’s population is 23,472 people, which is split between 49.8% male (11,698), and 50.2% female (11,774). [Link] 23,524 identify as one 
                                                       race, where 19,302 are white, 3,267 are African American, 75 American Indian and Alaska Native, 494 Asian, 3 Native Hawaiian and Other Pacific Islander, 
                                                       and 383 are some other race.[Link]" ),
                                                     p("57.9% of the population within Goochland County is employed. The unemployment rate is 3.7% [Link"),
                                                     p("There are 11,001 civilian employed population, 418 are employed under agriculture, forestry, fishing and hunting, and mining. [Link]"),
                                                     p("There are a total of 8,711 households in Goochland County. The median income is $97,146 with a margin of error of around 8,582. Around 24.1% of the 6,600 
                                                       family have one earner, while 46.1% have two earners. [Link] The greatest proportion (20.5%) of earners in Goochland earn between $100,000 to $149,999. 18.4% 
                                                       of earners in Goochland earn $200,000 plus. [Link]"),
                                                     p("Nearly 93.1% of the population 25 and over have graduate high school and gone to further their academic career. The highest level of education, a graduate or 
                                                       professional degree has been attained by around 3,531 people, or 20.1% of the population over 25 years old. [Link]"),
                                                     p("There were 355 farms with an average farm size of 160. This makes the total land coverage of farms to be 56,739 acres. $ 11,740,000 was generated from products 
                                                       sold to market. 46% of farms sold less than $2,500, and 3% of farms sold between over $100,000. Grains, oilseeds, dry beans, and dry peas were the main crop that 
                                                       was sold ($2,846,000) and Milk from cows were the main Livestock, poultry, and products sold ($4,936,000). [Link]"),
                                                     p("1.0% of Goochland’s population moved within the county, 8.4% moved into the county from a different county in VA, .7% moved from a completely different state, .3% 
                                                       moved from abroad. [Link]"),
                                              ) ,
                                              column(8, 
                                                     h4(strong("Sociodemographics")),
                                                     selectInput("var1", "Select Variable:", width = "100%", choices = c(
                                                       "Rainfall" = "rainfall",
                                                       "Minimum Temperature" = "min", 
                                                       "Maximum Temperature" = "max")
                                                     ),
                                                     plotlyOutput("precipitation"),
                                                     p(tags$small("Data Source: US Climate"))),
                                              column(12, 
                                                     h4("References: "), 
                                                     p(tags$small("[1] Groundwater: Groundwater sustainability. (2021). Retrieved July 27, 2021, from https://www.ngwa.org/what-is-groundwater/groundwater-issues/groundwater-sustainability")) ,
                                                     p("", style = "padding-top:10px;")) 
                                     )), 
                            tabPanel("Powhatan", 
                                     fluidRow(style = "margin: 6px;",
                                              h1(strong("Powhatan"), align = "center"),
                                              p("", style = "padding-top:10px;"), 
                                              column(4, 
                                                     h4(strong("County Background")),
                                                     p("Powhatan, located in the Virginia’s Central Piedmont, was founded in 1777 by the Virginia General Assembly. It is 272 mi2 and is home to a population 
                                                       of 29,253. The James River borders the North end of the country, contributing to the formation of many creeks stretching southward throughout the county. 
                                                       There are five districts within the county and 12 polling places interspersed through them. Powhatan is rich in history and offers an abundance of tourist 
                                                       attractions contributing to its thriving economy. There are three parks/wildlife management areas within the county: Powhatan Wildlife Management Area, Fighting Creek Park, 
                                                       and Powhatan State Park. Where once were several farms, the Powhatan Wildlife Management Area is 4462 acres that provide many experiences such as hunting, fishing and other 
                                                       forested activities that aim to maintain the diversity of its natural wildlife species."),
                                                     
                                                     h4(strong("Summary Statistics")),
                                                     p("The total population is 29,253 people, split between 51% male (15,188), and 49% female (14,065). [Link] 28,762 identify as one race, where 25,732 are white, 2,505 are African 
                                                       American, 64 American Indian and Alaska Native, 169 Asian, 24 Native Hawaiian and Other Pacific Islander, and 268 are some other race.[Link]."),
                                                     p("24,715 or 57.3% of the population within Powhatan County is employed, along with an unemployment rate of 1.4%."),
                                                     p("Of the 13,938 civilian employed population, there are very few that are employed in agriculture, forestry, fishing, hunting, and mining. Around .94% of the civilian employed 
                                                       population fall under that category. Of that .94% of the workers, around half of them serve roles in management, business, science, and art occupations while 14.5% of that 
                                                       population work in natural resources, construction, and maintenance occupations. [Link]"),
                                                     p("There were 263 farms with an average farm size of 132. This makes the total land coverage of farms to be 34,585 acres. $11,249,000 was generated from products sold to market. 
                                                       54% of farms sold less than $2,500, and 13% of farms sold between $25,000 and $24,999. Grains, oilseeds, dry beans, and dry peas were the main crop that was sold ($2,542,000) 
                                                       and poultry and eggs were the main Livestock, poultry, and products sold ($6,056,000). [Link]"),
                                                     p("Of the 10,392 households, the median income is $93,833 with a margin of error of around 5,342. Around 30.2% of the 8,220 family have one earner, while 44.8% have two earners. [Link] 
                                                       The greatest proportion (23.4%) of earners in Powhatan earn between $100,000 to $149,999. [Link]"),
                                                     p("Nearly 89.6% of the population 25 and over have graduate high school and gone to further their academic career. The highest level of education, a graduate or professional degree has 
                                                       been attained by around 2,032 people, or 9.3% of the population over 25 years old. [Link]"),
                                                     p("1.9% of Powhatan’s population moved within the county, 7.4% moved into the county from a different county in VA, .8% moved from a completely different state, .1% moved from abroad. [Link]"),
                                                     p("As of the 2020, For both the male and female population, the highest proportion of the population are ages 55-59 making up 8.63% of the population, while the smallest percent of the population 
                                                       make up the senior citizens that are 85 years and older, which is 1.35% of the population. [Link]"),
                                              ) ,
                                              column(8, 
                                                     h4(strong("Sociodemographics")),
                                                     selectInput("var1", "Select Variable:", width = "100%", choices = c(
                                                       "Rainfall" = "rainfall",
                                                       "Minimum Temperature" = "min", 
                                                       "Maximum Temperature" = "max")
                                                     ),
                                                     plotlyOutput("precipitation"),
                                                     p(tags$small("Data Source: US Climate"))),
                                              column(12, 
                                                     h4("References: "), 
                                                     p(tags$small("[1] Groundwater: Groundwater sustainability. (2021). Retrieved July 27, 2021, from https://www.ngwa.org/what-is-groundwater/groundwater-issues/groundwater-sustainability")) ,
                                                     p("", style = "padding-top:10px;")) 
                                     ), 
                            ) 
                            
                            
                            
                 ),
                 
                 ## Tab Conclusion --------------------------------------------
                 tabPanel("Policy", value = "conclusion", 
                          fluidRow(style = "margin: 6px;",
                                   h1(strong("Land Use Policies"), align = "center"),
                                   p("", style = "padding-top:10px;"),
                                   p("Policy plays a key role in land-use. At every level- federal, state, and local- officials develop land use plans, with a wide 
                                     variety of different objectives and long-term visions. These plans drive changes in land-use, and it is important to investigate 
                                     policies at every level to get a full picture of land-use conversion."),
                                   tabsetPanel(
                                     tabPanel("Federal",
                                              column(6, 
                                                     p("", style = "padding-top:10px;"),
                                                     p(strong("The Conservation Reserve Program (CRP):")), 
                                                     p("The CRP is a federal land conversion program administered by the Farm Service Agency (FSA). 
                                                       The goal of this program is to reduce cropland acreage- a land retirement program that pays farmers to retire some of their crop land. 
                                                       This program has been a major driver of land retirement since it was implemented in 1985. The program is motivated by environmental 
                                                       protection goals. To get approved for the land retirement program, your land must hit specific criteria based on targeted environmental 
                                                       factors. There is then a bidding process. To farmers, this is an incentive to retire land. Studies show that this policy has led to farmers 
                                                       retire their less productive land. In 2005, “CRP paid $1.7 billion to keep a land area almost the size of Iowa out of production” (source). 
                                                       This federal land conversion program incentivizes farmers to retire their land- and lower production. The goal is to protect the environment."),
                                                     br(),
                                                     p(strong("Federal Crop Insurance Program:")),
                                                     p("This program is a partnership between the federal government and insurers- connecting the public and private sectors. 
                                                       This program does the opposite of the CRP and raises incentives to grow crops. The goal of the Federal Crop Insurance Program is not directly to affect 
                                                       land-use, but it does influence conversion rates. In 1993, after some catastrophic flooding, congress passed the Federal Crop Insurance Reform Act. This 
                                                       act increased the premium subsidies for all crop insurance products- now the program includes a revenue insurance option and catastrophic coverage. About 
                                                       60% of cultivated cropland in the Unites States is covered by the Federal Crop Insurance Program. This program raises incentives to grow crops, and could 
                                                       influence farmers to cultivate riskier, less productive land (source)."),
                                                     br(),
                                                     p(strong("Emergency Relief Program (ERP):")), 
                                                     p("The purpose of this program is to help agriculture producers offset damage caused by natural disasters such as drought or 
                                                     flooding (source). Funds are distributed in two phases, to aid livestock producers impacted by natural disasters. The USDA announced in May of 2022 that 
                                                       “commodity and specialty crop producers impacted by natural disaster events in 2020 and 2021 will soon begin receiving emergency relief payments totaling 
                                                       approximately $6 billion through the Farm Service Agency’s (FSA) new Emergency Relief Program (ERP) to offset crop yield and value losses” (source)."),
                                                     p(),
                                                     p(),
                                                     h4("References:"),
                                                     p(tags$small("[1] How Can You Help Protect Source Water? (n.d.). Retrieved July 29, 2021, from https://www.epa.gov/sourcewaterprotection/how-can-you-help-protect-source-water")), 
                                                     p(tags$small("[2] Well maintenance. (2009, April 10). Retrieved July 29, 2021, from https://www.cdc.gov/healthywater/drinking/private/wells/maintenance.html#:~:text=Wells%20should%20be%20checked%20and,example%2C%20arsenic%20and%20radon).")) ,
                                                     p(tags$small("[3] A Guide to Private Wells (pp. 5-25, Publication). (1995). Blacksburg, VA: Virginia Water Resources Research Center.")) ,
                                                     p("", style = "padding-top:10px;"),
                                                     
                                                     
                                              ) , 
                                              column(6, 
                                                     p("", style = "padding-top:10px;"),
                                                     p(strong("Emergency Conservation Program (ECP):")), 
                                                     p("This program “provides funding and technical assistance for farmers and ranchers to restore farmland damaged by natural disasters and for emergency water 
                                                       conservation measures in severe droughts” (source). This program does so by giving landowners funding to install water conservation systems or to repair 
                                                       damaged farmland. This is another example of a conservation program that gives farmers insurance, which could incentive farmers to continue to cultivate their 
                                                       land- regardless of the potential risks associated with damage from storms and droughts. Farms are eligible for this assistance if the damage is affecting 
                                                       productivity, there is evidence that conditions will worsen without intervention, and the repairs will be too costly without federal assistance (source). 
                                                       Up to 75% of the costs can be provided. The FSA County Committee can “approve applications up to $125,000 while $125,001 to $250,000 requires state committee 
                                                       approval (source)."),
                                                     br(), 
                                                     p(strong("Source Water Protection Program (SWPP):")),
                                                     p("This program is a joint project with the U.S. Department of Agriculture (USDA) Farm Service Agency (FSA) and the National Rural Water Association (NRWA), 
                                                       a non-profit water and wastewater utility membership organization (source). It was designed with the goal of protecting surface and ground water that is 
                                                       used as drinking water by rural residents. The NRWA employs full-time rural source water technicians that work with state and county FSA staff to make decisions 
                                                       on where pollution prevention is needed. The SWPP works at the local level, to educate and encourage farmers to prevent source water prevention. With this program, 
                                                       it is the local community to create and invest in a water protection plan."),
                                                     br(),
                                                     p(strong("Agriculture Risk Coverage (ARC) and Price Loss Coverage (PLC):")),
                                                     p("ARC program is an “income support program that provides payments when actual crop revenue declines below a specified guaranteed level” (source). PLC program “provides 
                                                     income support payments when the effective price for a covered commodity falls below its effective reference price” (source). Both programs provide financial protection 
                                                       to farmers. They serve as a safety net from drops in crop revenues and prices."),
                                     )), 
                                     tabPanel("State",
                                              p(),
                                              p('State level officials work within the confines of both federal and local policy. They aim to simultaneously enhance federal policy, while enabling local officials to make comprehensive 
                                              land-use plans. The state of Virginia is under the Dillon Rule which states that local ordinances must be consistent with state law (source). Local officials are the ones approving parcel-specific 
                                              land use plans, but state and federal officials play a key role (source). “The state courts are the "referees" to determine if land use decisions violated some aspect of various state laws, or if 
                                                the land use rules violated the state constitution in some way (source).'),
                                              column(6, 
                                                     p("", style = "padding-top:10px;"),
                                                     p(strong("Conservation Reserve Enhancement program (CREP):")), 
                                                     p("This is a state sponsored enhancement to the federal CRP. It is a cost-share program where federal reimbursement are made through the FSA for up to 
                                                       “50% of a participant's eligible expenses for implementing best management practices (BMP)”. BMP examples include adding fencing, alternative watering 
                                                       systems, and restoring wetlands. Participation in this program is voluntary, and the contract period is around 10-15 years (source)."),
                                                     br(),
                                                     p(strong("Agriculture and Forestal Districts (AFD):")),
                                                     p("The AFD program in Virginia was designed to “preserve and protect open spaces, forested areas, and agricultural lands” (source). This program makes 
                                                       it so land taxes are based on use rather than taxing solely on the market value. Land used for growing crops, for example, is taxed differently than 
                                                       developed property. This state level policy encourages localities to be purposeful with their property taxes. The hope is that this policy will be used 
                                                       to conserve and protect agricultural and forest land. These lands can be valued as “natural and ecological resources which provide essential open spaces 
                                                       for clean air sheds, watershed protection, wildlife habitat, aesthetic quality and other environmental purposes” (source). This program was formed in 1977 
                                                       (source). The potential benefits are to lower property taxes, safeguard the rural character of the community, and offer protection from eminent domain (source)."),
                                                     br(),
                                                     p(strong("Nonpoint Source (NPS) Pollution Management Program:")), 
                                                     p("This is a diverse network of state and local government programs that . Collectively, these programs “help to prevent water quality degradation and to restore 
                                                       the health of lakes, rivers, streams and estuaries by promoting and funding state and local watershed planning efforts, stream and wetland restoration and protection, 
                                                       education and outreach, and other measures to reduce and prevent NPS pollution from affecting the Commonwealth’s waters” (source)."),
                                                     p(),
                                                     p(),
                                                     h4("References:"),
                                                     p(tags$small("[1] How Can You Help Protect Source Water? (n.d.). Retrieved July 29, 2021, from https://www.epa.gov/sourcewaterprotection/how-can-you-help-protect-source-water")), 
                                                     p(tags$small("[2] Well maintenance. (2009, April 10). Retrieved July 29, 2021, from https://www.cdc.gov/healthywater/drinking/private/wells/maintenance.html#:~:text=Wells%20should%20be%20checked%20and,example%2C%20arsenic%20and%20radon).")) ,
                                                     p(tags$small("[3] A Guide to Private Wells (pp. 5-25, Publication). (1995). Blacksburg, VA: Virginia Water Resources Research Center.")) ,
                                                     p("", style = "padding-top:10px;"),
                                                     
                                                     
                                              ) , 
                                              column(6, 
                                                     p("", style = "padding-top:10px;"),
                                                     p(strong("Chesapeake Bay Preservation Act:")),
                                                     p("This program was developed in 1988 as an element of Virginia's NPS management program. The goal is to protect and improve water quality in the Chesapeake 
                                                     Bay by requiring effective land use management practices (source)."), 
                                                     p('"The Bay Act program is the only program administered by the Commonwealth of Virginia that comprehensively addresses the effects of land use planning and 
                                                     development on water quality. The Bay Act recognizes that local governments have the primary responsibility for land use decisions and expands their authority 
                                                     to manage water quality, and establish a direct relationship between water quality protection and local land use decision-making" (source).'),
                                                     br(),
                                                     p(strong("Total Maximum Daily Load (TMDL):")),
                                                     p("Significant portions of the Chesapeake Bay have been identified as not meeting water quality standards. Despite the Chesapeake Bay program, water quality goals 
                                                     have not been met. In December of 2010, the EPA issued a TMDL, a “pollution diet” to protect the Bay (source). This TMDL is divided among all the Bay states. However,
                                                       “regional or statewide consistency is rare in Virginia's land use planning process - even statewide requirements such as the Chesapeake Bay Regulations are interpreted 
                                                       differently by different jurisdictions” (source)."),
                                              )) ,
                                     tabPanel("County",
                                              p(),
                                              p('"In urbanizing areas such as the suburbs near Richmond, Hampton Roads, and Northern Virginia, control over how private property 
                                                is developed may be a contentious process involving landowners and their lawyers, neighbors or local residents upset over additional 
                                                development, and local officials. In Fairfax, Loudoun, and Prince William counties over the last 30 years, the Board of County Supervisor 
                                                election campaigns have been based on growth management issues. Local officials have reacted to citizen complaints, and incumbents have 
                                                been voted out of office because they were either too supportive of growth or too restrictive.” (source)."'),
                                              column(6,
                                                     h1(strong("Goochland"), align = "center"),
                                                     p("", style = "padding-top:10px;"),
                                                     p("Goochland County runs a land use program which assesses land based on use value as opposed to market value. The program was adopted by the county in 1978. There are multiple requirements for land to be eligible for the program as established by the State Land Evaluation Advisory Council:"),
                                                     tags$ul(
                                                       
                                                       tags$li("Land must be in production for sale 5 years prior to entering the program as agriculture or horticulture"),
                                                       
                                                       tags$li("Land must be zoned as agricultural"),
                                                       
                                                       tags$li("Land must meet minimum acreages for each land use category "),
                                                       
                                                       tags$li("All real estate taxes have been paid on parcel "),
                                                       
                                                     ),
                                                     p("There are also multiple land use categories including agriculture, horticulture, and forest use (source)."),
                                                     p("The main agricultural districts in the county include A1 (General), A2 (Limited), and A3 (Intensive) (source). These districts promote the protection
                                                     of agricultural land and encourage agribusiness. The Goochland County 2035 Comprehensive Plan includes an agricultural commitment to maintaining approximately
                                                     85% of the county in the Rural Enhancement Land Use Designation through 2035 (source). The county also supports economic development and tourism through the
                                                     ACRES initiative which “[Supports] Goochland’s Agricultural Community through Accessibility, Connectivity, Readiness, Education, and Sustainability” (source).
                                                     The initiative encourages the recognition of Goochland County’s agricultural history and identity and promotes rural economic development/tourism.")),
                                              column(6,
                                                     h1(strong("Powhatan"), align = "center"),
                                                     p("", style = "padding-top:10px;"),
                                                     p('Powhatan County land use policy includes a land use deferral program, Powhatan County code Section 70-76, which states that the purpose of land use is
                                                     to “preserve real estate devoted to agricultural, horticultural, forest and open space uses within its boundaries in the public interest....". 
                                                     The land use deferral program “offers a deferral of a portion of the real estate taxes for qualifying properties”. This ordinance was adopted by the
                                                     county in 1976 and approximately 40% of the county is in land use today (source). Powhatan County also has an Agricultural and Forestal District (AFD)
                                                     Program which allows the county, with the landowner’s consent, to take land out of development in exchange for a land use tax rate as opposed to market
                                                     value tax rate. As of September/October 2020, there are approximately 5640 acres of AFD land. This program serves to protect natural lands as well as prevent
                                                     landowners from having to sell their land as market values and tax rates continue to increase. One benefit that the AFD program has over the land use deferral
                                                     program is that it is officially included in the County’s Comprehensive Plan (source). ')),
                                                     p('The county’s zoning ordinance categorizes rural districts into 6 groups. The main agricultural districts are A-20 (min 20 ac), A-10 (min 10 ac), and A-C.
                                                     The 3 other rural districts are largely dedicated to residential zoning. The 2010 long range comprehensive plan also includes sections on natural conservation
                                                     and rural preservation which outline land use policies to be “used when addressing development and land use issues” (source). These policies promote the
                                                     conservation of open land and farmland and recognize agriculture as an economic driver of the community.'),
                                              column(12, 
                                                     h4("References:"),
                                                     p(tags$small("[1] How Can You Help Protect Source Water? (n.d.). Retrieved July 29, 2021, from https://www.epa.gov/sourcewaterprotection/how-can-you-help-protect-source-water")), 
                                                     p(tags$small("[2] Well maintenance. (2009, April 10). Retrieved July 29, 2021, from https://www.cdc.gov/healthywater/drinking/private/wells/maintenance.html#:~:text=Wells%20should%20be%20checked%20and,example%2C%20arsenic%20and%20radon).")) ,
                                                     p(tags$small("[3] A Guide to Private Wells (pp. 5-25, Publication). (1995). Blacksburg, VA: Virginia Water Resources Research Center.")) ,
                                                     p("", style = "padding-top:10px;")) 
                                     )
                                   ) 
                          ) 
                          
                          
                 ),
                 ## Tab Introduction--------------------------------------------
                 tabPanel("Variables??", value = "conclusion", 
                          fluidRow(style = "margin: 6px;",
                                   
                                   p("", style = "padding-top:10px;"),
                                   tabsetPanel(
                                     tabPanel("Land Use",
                                              h1(strong("Land Use Data"), align = "center"),
                                              p("", style = "padding-top:10px;"),
                                              column(4, 
                                                     h4(strong("Land Use in Goochland and Powhatan Counties")),
                                                     p("As residential and commercial businesses have grown in the past ten years in Floyd, there continues to be a different demographic of the new movers
                                       into the county. The new residents share a household income that is significantly higher than those traditionally residing in Floyd 
                                       for the past ten years, and their home values have almost doubled. Due to the recent pandemic, there was a push to move to rural areas and work
                                       from home, resulting in home values increasing in the past two years. Many new residents are moving into Floyd for its land features, natural 
                                       beauty, and vibrant culture of music, arts, local foods and wines, and outdoor recreation. However, these same residents work outside the county
                                       and contribute less to the county's economy. This trend is evident when observing commuting data for Floyd County from the Virginia Employment 
                                       Commission [6]. Floyd has roughly 60% of employees that live in Floyd, but commute out of the county for their job, only 15%, in contrast,
                                       that commute into the county for work, leaving the remaining 25% of people who both work and live in the county [5]. ")
                                              ), 
                                              column(8, 
                                                     h4(strong("Graphs of Land Use Distributions and Changes")),
                                                     selectInput("econ1", "Select Variable:", width = "100%", choices = c(
                                                       "Employment by Industry [1]" = "industry",
                                                       "Projected Population Change [2]" = "pop",
                                                       "Income per Capita [3]" = "capita", 
                                                       "Population by Age [4]" = "age", 
                                                       "Number of Commuters [5]" = "commute", 
                                                       "New Business Growth [6]" = "business",
                                                       "Retail Sales by Type [7]" = "retail",
                                                       "Unemployment Rate Timeseries [8]" = "unemplo")
                                                     ),
                                                     plotlyOutput("trend1", height = "600px")
                                                     
                                              ),
                                              column(12, 
                                                     
                                                     h4("References") , 
                                                     p(tags$small("[1] American Community Survey 5-year Estimates 2014/2019")), 
                                                     p(tags$small("[2] U.S. Census Bureau, Weldon Cooper Center for Public Service")), 
                                                     p(tags$small("[3] U.S Census Bureau")), 
                                                     p(tags$small("[4]  2010 Census")), 
                                                     p(tags$small("[5] U.S. Census Bureau, OnTheMap Application and LEHD Origin-Destination Employment Statistics, 2014")), 
                                                     p(tags$small("[6] Virginia Employment Commission, Economic Information & Analytics, Quarterly Census of Employment and Wages (QCEW), 4th Quarter (October, November, December) 2020.")), 
                                                     p(tags$small("[7] American Community Survey 5-year Estimates 2014/2019")), 
                                                     p(tags$small("[8]  Virginia Employment Commission")) )
                                              
                                     ), 
                                     tabPanel("Crop Layer",
                                              h1(strong("Crop Layer Data"), align = "center"),
                                              p("", style = "padding-top:10px;"),
                                              column(4, 
                                                     h4(strong("Crops Grown in Goochland and Powhatan Counties")),
                                                     p("As residential and commercial businesses have grown in the past ten years in Floyd, there continues to be a different demographic of the new movers
                                       into the county. The new residents share a household income that is significantly higher than those traditionally residing in Floyd 
                                       for the past ten years, and their home values have almost doubled. Due to the recent pandemic, there was a push to move to rural areas and work
                                       from home, resulting in home values increasing in the past two years. Many new residents are moving into Floyd for its land features, natural 
                                       beauty, and vibrant culture of music, arts, local foods and wines, and outdoor recreation. However, these same residents work outside the county
                                       and contribute less to the county's economy. This trend is evident when observing commuting data for Floyd County from the Virginia Employment 
                                       Commission [6]. Floyd has roughly 60% of employees that live in Floyd, but commute out of the county for their job, only 15%, in contrast,
                                       that commute into the county for work, leaving the remaining 25% of people who both work and live in the county [5]. ")
                                              ), 
                                              column(8, 
                                                     h4(strong("Crop Layer Visualizations")),
                                                     selectInput("econ1", "Select Variable:", width = "100%", choices = c(
                                                       "Employment by Industry [1]" = "industry",
                                                       "Projected Population Change [2]" = "pop",
                                                       "Income per Capita [3]" = "capita", 
                                                       "Population by Age [4]" = "age", 
                                                       "Number of Commuters [5]" = "commute", 
                                                       "New Business Growth [6]" = "business",
                                                       "Retail Sales by Type [7]" = "retail",
                                                       "Unemployment Rate Timeseries [8]" = "unemplo")
                                                     ),
                                                     plotlyOutput("trend1", height = "600px")
                                                     
                                              ),
                                              column(12, 
                                                     
                                                     h4("References") , 
                                                     p(tags$small("[1] American Community Survey 5-year Estimates 2014/2019")), 
                                                     p(tags$small("[2] U.S. Census Bureau, Weldon Cooper Center for Public Service")), 
                                                     p(tags$small("[3] U.S Census Bureau")), 
                                                     p(tags$small("[4]  2010 Census")), 
                                                     p(tags$small("[5] U.S. Census Bureau, OnTheMap Application and LEHD Origin-Destination Employment Statistics, 2014")), 
                                                     p(tags$small("[6] Virginia Employment Commission, Economic Information & Analytics, Quarterly Census of Employment and Wages (QCEW), 4th Quarter (October, November, December) 2020.")), 
                                                     p(tags$small("[7] American Community Survey 5-year Estimates 2014/2019")), 
                                                     p(tags$small("[8]  Virginia Employment Commission")) )) ,
                                     tabPanel("Traffic Data",
                                              h1(strong("Traffic & Commute Data"), align = "center"),
                                              p("", style = "padding-top:10px;"),
                                              column(4, 
                                                     h4(strong("Traffic in Goochland and Powhatan Counties")),
                                                     p("As residential and commercial businesses have grown in the past ten years in Floyd, there continues to be a different demographic of the new movers
                                       into the county. The new residents share a household income that is significantly higher than those traditionally residing in Floyd 
                                       for the past ten years, and their home values have almost doubled. Due to the recent pandemic, there was a push to move to rural areas and work
                                       from home, resulting in home values increasing in the past two years. Many new residents are moving into Floyd for its land features, natural 
                                       beauty, and vibrant culture of music, arts, local foods and wines, and outdoor recreation. However, these same residents work outside the county
                                       and contribute less to the county's economy. This trend is evident when observing commuting data for Floyd County from the Virginia Employment 
                                       Commission [6]. Floyd has roughly 60% of employees that live in Floyd, but commute out of the county for their job, only 15%, in contrast,
                                       that commute into the county for work, leaving the remaining 25% of people who both work and live in the county [5]. ")
                                              ), 
                                              column(8, 
                                                     h4(strong("Traffic Visualizations")),
                                                     selectInput("econ1", "Select Variable:", width = "100%", choices = c(
                                                       "Employment by Industry [1]" = "industry",
                                                       "Projected Population Change [2]" = "pop",
                                                       "Income per Capita [3]" = "capita", 
                                                       "Population by Age [4]" = "age", 
                                                       "Number of Commuters [5]" = "commute", 
                                                       "New Business Growth [6]" = "business",
                                                       "Retail Sales by Type [7]" = "retail",
                                                       "Unemployment Rate Timeseries [8]" = "unemplo")
                                                     ),
                                                     plotlyOutput("trend1", height = "600px")
                                                     
                                              ),
                                              column(12, 
                                                     
                                                     h4("References") , 
                                                     p(tags$small("[1] American Community Survey 5-year Estimates 2014/2019")), 
                                                     p(tags$small("[2] U.S. Census Bureau, Weldon Cooper Center for Public Service")), 
                                                     p(tags$small("[3] U.S Census Bureau")), 
                                                     p(tags$small("[4]  2010 Census")), 
                                                     p(tags$small("[5] U.S. Census Bureau, OnTheMap Application and LEHD Origin-Destination Employment Statistics, 2014")), 
                                                     p(tags$small("[6] Virginia Employment Commission, Economic Information & Analytics, Quarterly Census of Employment and Wages (QCEW), 4th Quarter (October, November, December) 2020.")), 
                                                     p(tags$small("[7] American Community Survey 5-year Estimates 2014/2019")), 
                                                     p(tags$small("[8]  Virginia Employment Commission")) ) 
                                     )
                                   ) 
                          ) 
                          
                          
                 ), 
                 
                 ## Tab Economics--------------------------------------------
                 tabPanel("???", value = "economy",
                          fluidRow(style = "margin: 6px;",
                                   h1(strong("Residental and Commerical Development"), align = "center"),
                                   p("", style = "padding-top:10px;"),
                                   column(4, 
                                          h4(strong("Economic Growth")),
                                          p("As residential and commercial businesses have grown in the past ten years in Floyd, there continues to be a different demographic of the new movers
                                       into the county. The new residents share a household income that is significantly higher than those traditionally residing in Floyd 
                                       for the past ten years, and their home values have almost doubled. Due to the recent pandemic, there was a push to move to rural areas and work
                                       from home, resulting in home values increasing in the past two years. Many new residents are moving into Floyd for its land features, natural 
                                       beauty, and vibrant culture of music, arts, local foods and wines, and outdoor recreation. However, these same residents work outside the county
                                       and contribute less to the county's economy. This trend is evident when observing commuting data for Floyd County from the Virginia Employment 
                                       Commission [6]. Floyd has roughly 60% of employees that live in Floyd, but commute out of the county for their job, only 15%, in contrast,
                                       that commute into the county for work, leaving the remaining 25% of people who both work and live in the county [5]. "),
                                          p("Note that the only apparent sectors that show an increase include manufacturing and health services whereas the other sectors have stayed 
                                       consistent or have declined within the past 5 years. Depending on these sectors’ water usage, the county may or may not be able to withstand further 
                                       increases in their future development plans [1].  Floyd County’s population is projected  to continue to grow at a steady rate necessitating the need 
                                       for job creation in the county to support the population change. The stakeholders emphasized a high average age which potentially can limit the
                                       type and number of new jobs that are viable to thrive within the county. Therefore, an increase in population as a whole would counter act the county’s 
                                       aging population, opening up the sectors based on their skill base [4]. In terms of income per capita which is an important indicator for the economic 
                                       health of an area, Floyd County is consistently below average compared to the other localities indicating low wages for residents even compared to 
                                       similar counties and though the most recent data for new business growth shows constant new businesses, there is no positive trend which indicators the 
                                       county is growing in terms of GDP [3][6]. The retail sales by type graph shows this inconclusiveness further due to no sector having a strong positive slope 
                                       over the last 8 years [7]. "),
                                          p("As the United States aims to move toward a greener more sustainable future, the job market will evolve accordingly, whether by choice or by government mandate. 
                                       Focusing on new green industries and infrastructure has the potential to attract more residents to work within the county and bring new businesses, residents, and tourists to operate, work, live, and enjoy leisure time in Floyd County. ")
                                   ), 
                                   column(8, 
                                          h4(strong("Graph of Economic Parameters")),
                                          selectInput("econ1", "Select Variable:", width = "100%", choices = c(
                                            "Employment by Industry [1]" = "industry",
                                            "Projected Population Change [2]" = "pop",
                                            "Income per Capita [3]" = "capita", 
                                            "Population by Age [4]" = "age", 
                                            "Number of Commuters [5]" = "commute", 
                                            "New Business Growth [6]" = "business",
                                            "Retail Sales by Type [7]" = "retail",
                                            "Unemployment Rate Timeseries [8]" = "unemplo")
                                          ),
                                          plotlyOutput("trend1", height = "600px")
                                          
                                   ),
                                   column(12, 
                                          
                                          h4("References") , 
                                          p(tags$small("[1] American Community Survey 5-year Estimates 2014/2019")), 
                                          p(tags$small("[2] U.S. Census Bureau, Weldon Cooper Center for Public Service")), 
                                          p(tags$small("[3] U.S Census Bureau")), 
                                          p(tags$small("[4]  2010 Census")), 
                                          p(tags$small("[5] U.S. Census Bureau, OnTheMap Application and LEHD Origin-Destination Employment Statistics, 2014")), 
                                          p(tags$small("[6] Virginia Employment Commission, Economic Information & Analytics, Quarterly Census of Employment and Wages (QCEW), 4th Quarter (October, November, December) 2020.")), 
                                          p(tags$small("[7] American Community Survey 5-year Estimates 2014/2019")), 
                                          p(tags$small("[8]  Virginia Employment Commission")) ) 
                                   
                          )
                          
                          
                 ), 
                 ## Tab Data and Methodology--------------------------------------------
                 tabPanel("Data", 
                          fluidRow(style = "margin: 6px;",
                                   h1(strong("Data and Methodology"), align = "center"),
                                   p("", style = "padding-top:10px;"),
                                   column(4,
                                          img(src = "data-acs.png", style = "display: inline; float: left;", width = "200px"),
                                          p(strong("American Community Survey"), "The American Community Survey (ACS) is an ongoing yearly survey conducted by the U.S Census Bureau. ACS samples households to compile 1-year and 5-year datasets 
                                      providing information on population sociodemographic and ocioeconomic characteristics including employment, disability, and health insurance coverage. We used ACS 2014/18 5-year
                                      estimates to obtain census tract and census block group-level to explore Floyd County resident characteristics."),
                                          br(""),
                                          img(src = "data-ngwa.png", style = "display: inline; float: left;", width = "150px"),
                                          p(strong("USGS National Land Cover Database"), " ***description*** ")
                                   ),
                                   column(4,
                                          img(src = "data-nrv.png", style = "display: inline; float: left;", width = "150px"),
                                          p(strong("Goochland County Administrative Data"), " ***description*** "),
                                          br(""),
                                          img(src = "data-usgsnhd.jpeg", style = "display: inline; float: left;", width = "200px"),
                                          p(strong("VDOT Traffic Data "), " ***description*** "),
                                          br(""),
                                          
                                   ),
                                   column(4,
                                          img(src = "data-epa.png", style = "display: inline; float: left;", width = "150px"),
                                          p(strong("Powhatan County Administrative Data"), " ***descripition*** "),
                                          br(""),
                                          img(src = "data-google-earth.png", style = "display: inline; float: left;", width = "120px"),
                                          p(strong("Google Earth Engine."), "Google Earth Engine combines a multi-petabyte catalog of satellite imagery and geospatial datasets with planetary-scale analysis 
                                     capabilities and makes it available for scientists, researchers, and developers to detect changes, map trends, and quantify differences on the Earth's surface. We 
                                       used it to collect data on NDWI, precipitation and elevation based on the geographical location of the well sites for the  well water estimation model using NDWI."),
                                          br(""), 
                                           
                                          
                                   ),
                                   
                          )
                 ),
                 
                 
                 ## Tab Team --------------------------------------------
                 tabPanel("Meet the Team", 
                          fluidRow(style = "margin-left: 100px; margin-right: 100px;",
                                   align = "center",
                                   br(""),
                                   h1(strong("Meet the Team")),
                                   h4(strong("VT Data Science for the Public Good")),
                                   p("The", a(href = 'https://aaec.vt.edu/academics/undergraduate/beyond-classroom/dspg.html', 'Data Science for the Public Good (DSPG) Young Scholars program', target = "_blank"),
                                     "is a summer immersive program held at the", a(href = 'https://aaec.vt.edu/index.html', 'Virginia Tech Department of Agricultural'), "and", a(href = 'https://ext.vt.edu/','Applied Economics and the Virginia Cooperative Extension Service.'),
                                     "In its second year, the program engages students from across the country to work together on projects that address state, federal, and local government challenges around critical
                                social issues relevant in the world today. DSPG young scholars conduct research at the intersection of statistics, computation, and the social sciences to determine how 
                                information generated within every community can be leveraged to improve quality of life and inform public policy. For more information on program highlights, how to apply,
                                and our annual symposium, please visit", 
                                     a(href = 'https://aaec.vt.edu/content/aaec_vt_edu/en/academics/undergraduate/beyond-classroom/dspg.html#select=1.html', 'the official VT DSPG website.', target = "_blank")),
                                   p("", style = "padding-top:10px;")
                          ),
                          fluidRow(style = "margin-left: 100px; margin-right: 100px;",
                                   column(6, align = "center",
                                          h4(strong("DSPG Undergraduate Interns")),
                                          img(src = "farm.jpg", style = "display: inline; border: 1px solid #C0C0C0;", width = "150px"),
                                          img(src = "team-julie.jpg", style = "display: inline; border: 1px solid #C0C0C0;", width = "150px"),
                                          br(), 
                                          img(src = "rachel.jpg", style = "display: inline; border: 1px solid #C0C0C0;", width = "150px"),
                                          p(a(href = 'https://www.linkedin.com/in/esha-dwibedi-83a63476/', 'John Malla', target = '_blank'), "(Virginia Tech, PHD in Economics);",
                                            br(), 
                                            a(href = 'https://www.linkedin.com/in/julie-rebstock', 'Christopher Vest', target = '_blank'), "(Virgina Tech, Undergraduate in Economics and Computational Modeling and Data Analytics);",
                                            br(), 
                                            a(href = 'www.linkedin.com/in/rachelinman21', 'Rachel Inman', target = '_blank'), "(Virginia Tech, Undergraduate in Smart and Sustainable Cities and Minoring in Landscape Architecture)."),
                                          p("", style = "padding-top:10px;") 
                                   ),
                                   column(6, align = "center",
                                          h4(strong("VT Faculty Members")),
                                          img(src = "team-posadas.jpg", style = "display: inline; margin-right: 5px; border: 1px solid #C0C0C0;", width = "150px"),
                                          img(src = "team-sarah.jpg", style = "display: inline; border: 1px solid #C0C0C0;", width = "150px"),
                                          p(a(href = "https://www.linkedin.com/in/briannaposadas/", 'Dr. Susan Chen', target = '_blank'), "(Postdoctoral Associate Department of Agricultural, Leadership, & Community Education);",
                                            br(), 
                                            a(href = '', 'Dr. Wei Zhang', target = '_blank'), "(Associate Professor Department of Biology Virginia State University)."),
                                          p("", style = "padding-top:10px;")
                                   )
                          ),
                          fluidRow(style = "margin-left: 100px; margin-right: 100px;",
                                   column(6, align = "center",
                                          h4(strong("DSPG Graduate Fellows")),
                                          img(src = "farm.jpg", style = "display: inline; border: 1px solid #C0C0C0;", width = "150px"),
                                          img(src = "team-julie.jpg", style = "display: inline; border: 1px solid #C0C0C0;", width = "150px"),
                                          br(), 
                                          img(src = "---.jpg", style = "display: inline; border: 1px solid #C0C0C0;", width = "150px"),
                                          p(a(href = 'https://www.linkedin.com/in/esha-dwibedi-83a63476/', 'Nazmul Huda', target = '_blank'), "(Virginia Tech, PHD in Economics);",
                                            br(), 
                                            a(href = 'https://www.linkedin.com/in/julie-rebstock', 'Yuanyuan Wen', target = '_blank'), "(Virgina Tech, Undergraduate in Economics and Computational Modeling and Data Analytics);",
                                            br(), 
                                            a(href = 'www.linkedin.com/in/rachelinman21', 'Samantha Rippley', target = '_blank'), "(Virginia Tech, Undergraduate in Smart and Sustainable Cities and Minoring in Landscape Architecture)."),
                                          p("", style = "padding-top:10px;") 
                                   ),
                                   column(6, align = "center",
                                          h4(strong("Project Stakeholders")),
                                          img(src = "team-posadas.jpg", style = "display: inline; margin-right: 5px; border: 1px solid #C0C0C0;", width = "150px"),
                                          img(src = "team-sarah.jpg", style = "display: inline; border: 1px solid #C0C0C0;", width = "150px"),
                                          p(a(href = "https://www.linkedin.com/in/briannaposadas/", 'Rachel ---', target = '_blank'), "(Postdoctoral Associate Department of Agricultural, Leadership, & Community Education);",
                                            br(), 
                                            a(href = '', 'Nichole ---', target = '_blank'), "(Associate Professor Department of Biology Virginia State University)."),
                                          p("", style = "padding-top:10px;")
                          )
                 )) ,
                 inverse = T)



server <- function(input, output){
  
}
 

shinyApp(ui = ui, server = server)