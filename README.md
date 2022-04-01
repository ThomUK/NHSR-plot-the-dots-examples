# NHSR-plot-the-dots-examples
Some examples of get-started code to demonstrate the NHSRplotthedots package.  This will be developed into an NHS-R workshop on the package, and how to use it.  Planning and TODO's are below:

Sections to write:

1. Session aims
    1. Quick skip through SPC
    1. Become familiar and confident with using the package.
    1. Develop the skeleton of an RMarkdown tool, and look at other possible use-cases:
        1. One-hit SPC charts to paste into other work.
        1. Rmd reporting (as we will aim for here).
        1. R Shiny dashboarding (beyond scope of this session, but others are doing it will be happy to share).
    
1. Background
    1. SPC, Making Data Count - reccommended videos
    1. NHSRplotthedots - origin story and how it came to be
        1. Other SPC packages {qicharts}, {qcc}, {runcharter}
    1. Link to the podcast episode

1. Get Started with the package
    1. Install and load it
    1. Minimal Example (fewest lines of code possible)
    1. Read some "real" data in.
        1. NHSRdatasets
        1. Excel (with some shaping to get it into the right format)
        1. ODBC database connection (out of scope, but powerful)
        1. API (out of scope, but powerful)
    1. The two main outputs
        1. Chart
        1. Underlying dataframe
    1. Main differences vs. excel (awareness, not detailed)
    1. Removing error message for <12 points (here be monsters):  `options("ptd_spc.warning_threshold" = 0)`

1. Package options
    1. Faceting
    1. Targets
    1. Rebasing
    1. Fixing calculation periods
    1. Visual options
        1. Title and axes
        1. Icons
        1. Axis labels
        1. Further modifying the ggplot object (eg. ft background)

1. Building a simple looped report
    1. Structuring the incoming data
    1. Writing the Rmd file
    1. Adding titles and commentary

1. Get involved!
    1. Further package development
    1. More training
    1. Ideas and feature requests
    
