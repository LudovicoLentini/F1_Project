# F1_Project
Estimation of F1 rankings using different Machine Learning Algorithms.

### Research Title
Machine learning’s techniques to predict F1 Constructors Championship and Drivers Championship standings

### Abstract
Our Statistical Learning project aims to link our shared passion for Formula 1 to our restricted statistics and machine learning knowledge. The main goal is to try to predict the winners of both the Constructor and Drivers Championship. We will focus on different techniques in order to understand which performs better according to the available data and to the variables we will take into account.

## Files:
- *EPFL_Report_Thesis_Template-3*: Final written report about the Project
- *F1- Analysis & Prediction* : Presentation slides 
- *F1 Prediction* : Html Markdown, preview here: https://htmlpreview.github.io/?https://github.com/LudovicoLentini/F1_Project/blob/main/F1-prediction.html
- *R scripts* folder: Data, R code and testing of different ML Algorithms.


### Main research aim & framework
The idea of our project comes from a shared passion for the F1 races and we are interested in understanding whether our knowledge in statistics and machine learning could help us build a model able to predict F1 standings. In fact our main goal is to use some of the variables that we found on http://ergast.com/mrd/db/#csv, which is a very documented dataset containing all the information records regarding F1 weekends: Free Practice, Qualifying, Races…

### IML papers
The main papers from which we decided to go further on this project is https://medium.com/@willgeorge93/formula-1-championship-predictor-a-machine-learning-solution-a86efcb9298, https://www.f1-predictor.com/building-an-f1-prediction-engine-predictive-modelling-part-i/ and http://inseaddataanalytics.github.io/INSEADAnalytics/groupprojects/January2018FBL/Race31.html . They are very interesting because they explain well our main goal for this project.

### Data source(s)
We collect all our data from http://ergast.com/mrd/db/#csv. this dataset is divided in many tables which are very detailed and updated, the authors add also the latest info of these last weekends. We are planning to use R to build our predictor model and probably Python and SQL for data extraction.

### Data collection
The dataset that we found is very complete and contains detailed records of F1 races from 1950 to now. Realistically we are going to use just a subset of it (last twenty years maybe!). The dataset is composed by very interesting tables in which we can find any kind of information. There are records on the track, on the constructors, on the drivers, on the races, on the seasons, on lap times, on pit stops.

### Model & Methods
To the best of our current knowledge and on the basis of all the papers previously cited, we think that we are going to use regression ( different type of it) according to the distribution of our data, and use method like GCV, CV, Residual analysis… to evaluate the models performances.

### Software/Hardware Toolkit
As described above, the main software that we are going to use is R and all the relative packages on the regression, plot and all the other necessary tools to implement a complete project.



