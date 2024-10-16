# url_shortner

A new Flutter project.

## Getting Started

To setup this application in your local system follow the steps below

1. Take the ip address of the local machine where you going to run the application.
2. Come to the project, then create a secrets file inside lib folder of the project.
3. Inside secrets file store the ip. Like this const ip = 10.0.0.5,
4. Come to core folder inside lib, come to api folder inside core, and navigate to endpoints.dart file.
5. Inside endpoints file, you can see the base url, where ip is given as variable.
6. Import the file to this endpoints file where you stored the ip of your local machine.
7. Also if you want you can change the port.

## NodeJs SetUp

1. Let's start,
2. Before start, please install nodejs and mongo db in your system
3. Go to mongo db site, create a cluster there, please follow any tutorial
4. This is doing because , we need to have mongo db cloud envirnoment to store the data.
5. From there, we will get a url for access mongo db cloud server for our project.
6. Come to url-shortner-server folder in the project.
7. Create a .env file inside the folder, before that install dotenv package from npm, for that use the following command: npm i dotenv  -> this command will install dotenv in your node project, then create varible like i give inside the .env file:

MONGO_URL="your_mongo_db_url_here"
PORT="give_a_port_to_run_the_nodejs_server"
IP = your_local_machine_ip

Please make sure that the port you are giving will be the one you given in the endpoints base url in the api folder inside the core folder inside the lib.

I think it's almost completed.
Try to run the application.
If any error occur, debug and research and find the root cause,
You can solve, because you are also a developer who have the problem solving skills.
