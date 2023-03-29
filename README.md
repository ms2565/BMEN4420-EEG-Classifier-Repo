# BMEN4420-EEG-Classifier-Repo
*Classifier model using EEG-data to discriminate the visual presentation of faces and cars to a subject wearing an electrode array*

This EEG-Classifier is model developed to process EEG-data and discriminate
the visual presentation of faces and cars to a user wearing an EEG electrode
array. This README will see continuous updates over the course of the project.

Getting Started:
Once you've loaded this repo folder into your favorit matlab working directory,
you should be able to call EEG_Classifier.m as a function in your shell

>> EEG_Classifier()

And this will:

1) Build a parameters structure that stores basic analysis data like data 
structures for each subject, sampling frequency, file paths to navigate
through the Signal_Processing_FC folder, etc.

2) Load the data and store it in a set of variables

And from here we can basically treat this like we would  another 'HW' 
assignment

# IMPORTANT: COLLABORATIVELY MODIFYING THE CODE

I think it might be best to come up with a coding system that will make it easy to merge 
our code pieces and try out different methods/functions/algorithms that we each develop without having
to rewrite too much code. One of the best ways to do this could be

- Having a *low* threshold for turning multiple lines of code into functions.
  anything like developing our own filtering pipelines, feature selection/normalizing/reduction algorithms could
  be turned into a function formatted like: '<uni>_briefTitle.m'
  and could be called (for example):
  >> mas2565_PCA(x=data,y=dims);
  
Definitely open to a lot of suggestions here!^^
