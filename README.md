# [Florida TIGER/BUILD Grant Visualization](https://observablehq.com/@aaronbrezel/florida-tiger-build-grant-visualization)

## Purpose

BUILD, is a discretionary grant program from the U.S. Department of Transportation. Its hallmark is its flexibility. Applicants from the state to the municipal level, including counties, port authorities and tribal governments can petition for funding.

Today, it's known as BUILD, but the program was actually started in 2009 as TIGER under President Barack Obama. Where it was noted that the Obama administration provided the lion's share of grant funding to urban projects, the Trump administration has swung the pendulum in the opposite direction. Various advocacy groups have noted that the majority of funds have gone to rural projects--especially for road-building--in the two rounds overseen by the Trump Administration and Elaine Chao, the U.S. Secretary of Transportation.

As part of my work at the Miami Herald, I decided to visualize TIGER/BUILD grant funding in Florida over the life of the program. While the sample size of Florida projects funded under the Trump administration is too small to draw any significant conclusions, it is notable that the two largest projects awarded in this time have been for roads. 

The full visualization is available [here](https://observablehq.com/@aaronbrezel/florida-tiger-build-grant-visualization)

The code in this repo supports the above visualization. Files include an R program to clean data and various geographic geojson data for the map.

## Static Visuals

Chart and tooltip:

!(TIGER_BUILD Chart)[TIGER_BUILD_CHART.png]

Map and tooltip:

!(TIGER_BUILD Map)[TIGER_BUILD_MAP.png]

## Resources

- Visualization coded in [D3.js](https://d3js.org/)
- County data from [us-atlas](https://github.com/topojson/us-atlas)
