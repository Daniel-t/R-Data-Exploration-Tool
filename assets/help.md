## R Data Exploration Tool (RDET)

Welcome to RDET, this tool was built to simplify exploration of the R data libraries that are commonly installed.

### Left Panel

The left panel contains the settings for selecting and grphing your chosen dataset.

#### Specify Dataset
Allows you to select which data set you wish to explore.  NOTE: Some datasets (those with less than 3 columns) do not work and will cause an error.  Datasets which have parenthesis in there names '()' also cause errors
    

#### Graph Settings
_Choose X Axis , Choose Y Axis_
* Specify columns for X and Y fields
_Choose Color field_
* Specify the Column for Color,  if this is a continuous field, then the graph will show a gradient of color, if it is a factor then distinct colors for each

_Color As Factor_
* Force the color field to be treated as a factor

_Show Linear Regression Line_
* Show the linear regression for the graph, if the color field is a factor, separate regressions will be shown for each catagory.
  
### Main Panel

The main panel consists of two three, "Plot", "Table" & "Documentation/HELP".

_Plot Tab_
The plot tab shows the graph as specified in the left panel

_Table Tab_
Enables you to explore/sort/search the currently loaded dataset as a table

_Documentation/HELP_
This page, general usage and notes

### Notes/Known Errors/Etc

* ERROR: Data sets whcih contain parenthesis in their names do not load
* ERROR: Data sets with less then three columns do not load
* LIMITATION: Data sets with more than 10,000 rows are truncated for performance reasons

### Feedback
Any feedback is welcome by submitting Issues/Pull Requests/etc on the Git repository https://github.com/Daniel-t/R-Data-Exploration-Tool

### Thanks
Thanks to Jeff Leek, Roger Peng & Brian Caffo for putting together and running the Data Specialisation on Coursera. 

### Author
RDET was written by Daniel Thomas for the Data Products course on Coursera