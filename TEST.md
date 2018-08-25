push gif file to your github repo

# How to add GIF to Github READMe file

1. reate a video with quick time

2. Go to https://imgflip.com/gifgenerator

3. Get the gif link and paste it in the read me file in your github project


<!-- <a href="http://www.youtube.com/watch?feature=player_embedded&v=bDcrq8aMm-I&t=69s -->
<!-- " target="_blank"><img src="http://img.youtube.com/vi/bDcrq8aMm-I&t=69s/0.jpg" -->



![Example](resources/meetup.gif "demo for our app")

Presentation Outline:
Deliverables: struggles, things we learned (3 different things), changes we'd like to add

#Struggles:

We initially had difficulties with our seed data, there was a point in time where there were no duplicate entries within the join table. This led to confusion when trying to determine whether or not some of our methods were actually functioning. In order to rectify this we should have spent more time working on the construction of our seed data. Later, due to difficulties in this information, we self-populated data that was generated when we ran our application (is person1 = Event.create()). While this was initially helpful in the first few times we ran the application, after running our application 50 times there was a considerable amount of unnecessary / duplicate information stored in the database. We should have focussed on defining how we'd call instance methods within the applications, through something like the email helper method that we developed, when working with our instance methods to ensure that our seed data was usable.

There was a little confusion between us regarding what functionality we wanted different users to have. We should be spent more time at the beginning discussing these differences since realizing that we weren't on the same page while building the methods isn't very productive. Sometimes we had difficulties articulating *what* specifically the goal of the method we were working on was.

#Three things we learned:
Instead of defining just what we wanted our application to do, we should have thought through the process of *how* we were going to do it before starting to build methods. About half-way through we realized that we were repeating various tasks several times and while we did substitute helper methods after the fact, we could have saved time and effort initially creating the methods we knew we were going to be frequently using.

Test frequently - we found many bugs that took considerable effort to fix. Had we tested more frequently when writing our code we would have saved time and anguish.

Commit frequently - each of us independently worked on different aspects of the project. While these *thankfully* didn't overlap to a significant extent, there was a period of time when both of us had versions with different functionality that we wanted in our final version. Practicing proper version control, ie using branches and pulling changes as we progressed, saves time and effort.

Using APIs - our application uses three different APIs, in addition to information pulled from the faker gem. While neither of us we initially comfortable with the process of acquiring this information, this project provided us with the opportunity to become more competent.


#Things that we can do to improve
Even as we built out our product we identified that there were things we'd like to improve. The most readily apparent issue was how our users interacted with the different options we provide. Instead of simply having a list of 10 different options and requiring our users to select the one they were interested in using, we should have categorized our options to make the application more user friendly.

Better design - were we to continue working on this in the future, we'd like for the app to have a nicer interface, ie the option to scroll between different features.

what we can improve in the future is  in our interface, instead of listing all the options together, we can categorize them into different groups. and only present few options for  user at a giventime, so that users are easy to navigate.
