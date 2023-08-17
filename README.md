# pg-dock-sql
Refine your SQL skills using **pg-dock-sql**—a PostgreSQL Docker environment for hands-on coding challenges and solutions. This helps to elevate your proficiency in SQL through handson experience.

<p align="center">
<img width="300px" hiegth="300px" src="assets/pg-dock-sql.jpg"> </img>
</p>


#### Pre-Requisites
- docker (https://docs.docker.com/engine/install/)
- docker-compose (Refer to https://docs.docker.com/compose/)
- Visual Studio Code 
    - This is optional for local SQL development and debugging against the postgres docker container using an IDE.
- VS Code Plugins
    - This is optional.


#### Setup
- Clone the repository to your local machine
    ``` 
    git clone git@github.com:sibyabin/pg-dock-sql.git
    cd pg-dock-sql
    ```
    The directory will look like the below.
    ![Repository Structure](assets/repo-structure.jpg)
- Set below environment variables in your terminal
    ```
    export POSTGRES_DB=practise
    export POSTGRES_USER=dbuser
    export POSTGRES_PASSWORD=<password>
    ```
#### Launch the environment
- Run the command `sh launch-environment.sh `

#### Verify Installation
- Run `docker ps` command to check if the container started without issues
    ![](/assets/verify-setup1.png)
- Run below commands against the container to check whether the all the exercise schemas and tables are created 
    ```
    docker exec -it postgres psql -v --username dbuser --dbname practise -c "\dn"
    ```
    ![](/assets/verify-setup2.png)

### How to extend?

#### Create artifacts required
- Under scripts folder , create a folder structures in the format `exercise-<some_number>`.For e.g., `example-111`
```
    ├── exercise-111
    │   ├── code
    │   │   └── setup.sql
    │   │   ├── expected.sql
    │   │   └── solution.sql
    │   ├── README.md
    │   └── tests
    │       └── test1.sql
```

- **README.md**: This can be used to document the details of the problem. Test data to be used etc.
- **setup.sql**: This SQL can be used to create the required tables and then seed the test data.
- **expected.sql**: This SQL contains the expected output
- **solution.sql**: This SQL contains the solution to the problem implemented.


#### Validating your solution
- Please execute the following command on your system to validate the solution. This script will establish a connection with the PostgreSQL Docker container, execute your provided solution, and display both the expected and actual outputs.
    ``` sh check-solution.sh <some_number> ```
    ![validate solution](/assets/checking-solution.png)
--- 