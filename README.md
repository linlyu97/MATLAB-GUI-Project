# MATLAB-GUI-project
## 1.	Problem Definition 
Shortage of water resources and pollution of water environment are one of the major issues for social development[1]. Therefore, strengthening river water resources data management and protecting the river water environment are important conditions for realizing sustainable development strategies.

We need to design a smart system to help us manage our river water quality database intelligently. By using this river water quality information management and decision support system based on Matlab GUI, we can access to large amounts of data intuitively and efficiently, and plot water quality changing trend to provides decision support for relevant decision-making departments.
## 2.	Background and Solution Method
In the Matlab GUI environment, by accessing the database, we can manage the river water quality information, such as displaying table of a certain year, querying, modifying and deleting water quality data. And we can make the river water quality information image. For example, we can use a parameter selection button and a month selection button in the GUI interface to obtain a certain water quality parameter information. In addition, we can use the ‘Change Data’ button to change the certain data we obtained before.

And by observing the known data image, we can not only summarize the past rules, but also predict the development trend of river water quality information in the future. Based on the management of water quality information, we can generate a history of water quality change trend in the Matlab GUI environment[2]. And we can use the neural network pre-measurement algorithm to predict the water quality information and generate the future water quality image. By using this method, we can provide decision-making support for the relevant decision-making departments.

The feature of the whole system is realized in the Matlab GUI environment. The system has the advantages of friendly human-machine interaction, simple operation, convenient management and quick calculation. Besides, it has better actual application value and reference value.
## 3.	Program Design 
### 3.1	Code to write
The first subsystem, water quality information management, contains three parts of code to implement this system. The first part of the code is about connecting to the database, reading and calling data from the database. The second part of the code is about finding the location of the data corresponding to the selection conditions in the database. The third part of the code is about reading table, inquiring and modifying data after connecting to the database. 

The second subsystem, decision support system, is mainly about plotting water quality change trends and completing BP neural network water quality prediction algorithm. The first part is about drawing the image corresponding to the selected parameters, and getting the important information such as the average value. The second part is that to realize the general logic of BP neural network water quality prediction algorithm to help users predict the changes of river water quality in the future. 
### 3.2	Toolboxes
For the whole system, we are going to use Matlab app designer. App designer provides an interface design tool set to create graphical interfaces, such as interface design editors, form editors, etc.

For the second subsystem, we will use Matlab's Neural Network toolbox, which integrates many BP optimization algorithms. 
## 4.	Implementation
### 4.1	Design Diagram of the Whole System
 
Figure 1. Design of river water quality information management and decision support system 
The Figure 1. shows us the whole process of designing and building the system.
In this project, we would use the database of different water quality parameters for every month of Lyuliang City obtained by related government department.
The whole system consists of two subsystems: water quality information management and decision support system. The water quality information management system includes displaying a table of data according to a selected year, a piece of certain water quality information query, modification and deletion. The decision system includes water quality change trends, average value calculation function and water quality information forecasts.

Besides, the whole system has three layers. The first layer is called backstage, which mainly concludes all the algorithm in Matlab code view interface to realize all the functions of this system. The second layer is called data layer, which concludes the original water quality database, the images this system can plot and some characteristic values. As for the third layer: user layer, where users can click on buttons to realize the functions they need.
### 4.2	Implementation Interface
 
Figure 2.  GUI interface design of system
 
Figure 3.  Interface of after changing parameter selection and month selection
The Figure 2. shows us the interface design of the entire system and Figure 3. shows us the interface after changing parameters and other selection.

The left panel contains water quality information management subsystem which is the first part of this system. The first function is that users can click on the ‘Year Selection’ dropdown to select a year and click on ‘Read Data’ button so that a table would show in bottom and users can simply inquire the data they need. As for the second function, users can select a certain parameter in the ‘Parameter Selection’ dropdown and select a certain month in the ‘Month Selection’ button, then just click on ‘Inquire Single Data’ button to obtain a certain data. If the obtained certain data has something wrong, the third function is that users input data in the numerical edited area and then click on ‘Change Data’ button and the inquired certain data would be changed.

About the second part of this system in the left penal, it has two functions and I have achieved one of them. The system has eleven kinds of water quality data. The first function is that users can produce the corresponding water quality history curve by selecting a certain water quality parameter they need in the ‘Parameter Selection’ button’. By clicking on ‘Plot’ button, the history water quality curve would show in the figure and the corresponding title would show to indicate which parameter curve is plotted. As for the second function predicting water quality changing trend in the future, I would do more algorithm to realize it so that the whole system is truly more complete.

The realization of the whole project interface is based on Matlab app designer by using ‘callbacks, methods, properties’ to fully connect all the code. ‘Dropdown’ button uses switch case algorithm and in each case, we read data from database separately.
### 4.3	Bugs and Limitations
The first bug is about the ‘Year Selection’ dropdown and ‘Read Data’ button. In fact, I have tried several times about how to connect these two, but it seems like the code ‘t=readtable("Data.xlsx","Sheet",1) can not be initialized in ‘Property’ just as ‘current_data’. 

Secondly, I need to do more job about how to change the original data in the database if the data shown is wrong, rather than just changing the data shown in the numerical edit area by using ‘Change Data’ button.

Thirdly, as the project continues, there is a difficulty about BP neural network algorithm in the second part. From learning, about this algorithm we can use the [1, n-12] months of the known data (assuming n months are known) to predict the known [n-12, n] months of data. And when the predicted data is close to the known data, we can use the weight and threshold of each layer obtained by training to predict the data of [n, n+12] in the next 12 months.
## 5.	Conclusions
In this project, I have designed the whole system interface and write some code to realize its functions. In the water quality information management system, there are some functions like displaying a table of data according to a selected year, a piece of certain water quality information query, modification and deletion. And the decision system includes water quality change trends, average value calculation function and water quality information forecasts.
First, I learned how to come up with an idea based on what I learned in class and my previous experimental experience. Sometimes it is difficult to come up with an idea. Then when it comes to product design, we need to build a framework according to the needs, taking into account multiple levels, such as background, database, users, and then design the entire system based on the principle of convenience.

Secondly, after I came up with the idea, I learned to fully implement a system using app designer. I learned how to write code to implement various functions of buttons and connect them. However, throughout the project, there are still some shortcomings in my code, some places are like hardcode.
The last is about the study of algorithms for predicting future water quality. I only have a little theoretical knowledge. The actual practice needs to be continued later.

If Matlab is a semester course, I would have more time to improve the water quality prediction algorithm and learn the deep learning toolbox. With regard to product design, I plan to add a new section called the water quality evaluation to the whole system. Because after obtaining the required water quality data, we need to evaluate the water quality information and plus the part about the prediction system, which would make the whole system more complete and perfect.
## Reference
1. http://www.chinawater.net.cn/CWR_Journal/200008/11.html
2. Xiaohong Shi, Jia Zhou, Proficient in GUI interface programming[M]. Peking University Press, 2003,1. :pg164~178
