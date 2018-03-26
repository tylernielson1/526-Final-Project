# 526-Final-Project
A web application created as the final project of CIS 526
This project is a node.js application that is meant to serve as a central repository for information about soccer players and the teams they play for. 

## Building the project
In order to build the project, you must first have node, npm, and yarn installed.
Node and npm can be downloaded from here: https://nodejs.org/en/
Yarn can be downloaded from here: https://yarnpkg.com/en/docs/install

Once you have both of those installed, clone the repository and open the base directory in a terminal window.
Run the command `yarn install` to install the required dependencies.

## Running the project
In order to run the project, you must have a config file in the style of the sample config file found in the config directory named `config.js.
Without that, the project will not start as the information required to run will not be available.
If you do not have credentials for the database, please contact me and I will get something set up for you.
If you have created the config.js file, run the following command in the base directory of the project: `npm start`.
Navigate to localhost:'port number you specified' and you should be good to go.