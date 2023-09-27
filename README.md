# CEIS400-Group-4
DeVry-CEIS400 Software Engineering 2 Group Repo

## Course Project Lab 4 of 6: Software Design and Construction

### Overview
This repository contains all the deliverables for Lab 4 of the Software Design and Construction course. This lab focuses on the design and initial construction of the software project.

### Table of Contents
- [Deliverables](#deliverables)
- [Required Software](#required-software)
- [Lab Steps](#lab-steps)
- [Submission](#submission)
- [Rubric](#rubric)
- [Docker Setup](#docker-setup)

### Deliverables
- Step 1: Create a software design.
- Step 2: Create a software design description (SDD) document (GRADED).
- Step 3: Prepare for construction.
- Step 4: Construct the architecture (GRADED).
- Step 5: Begin constructing the components (GRADED).
- Step 6: Update project documents, as needed.
- Step 7: Submit deliverables (IN ZIP FILE).

### Required Software
- Microsoft Visio: For Step 1
- Microsoft Word: For Steps 1, 2, and 6
- Microsoft Visual Studio: For Steps 4 and 5
- Microsoft Project: For Step 6

### Lab Steps
Detailed lab steps are available in the Lab Steps document. This includes:
- Object-Oriented Analysis (OOA) of the Requirements
- Static and Dynamic Object-Oriented Design (OOD) Views
- Design Patterns
- Software Design Description (SDD) Document
- Preparing for Construction
- Constructing the Architecture
- Beginning the Construction of Components
- Updating Project Documents

### Submission
Create a zipped archive containing the following files:
- Software Design Description (SDD)
- Source code for architectural framework
- Status and description of program code completed to date
- Latest version of the project plan, business problem scenario, and test plan, if necessary
- Individual team member cumulative time sheet

Submit the zipped file as per the instructions.

### Rubric
- Software Design Description: 35 points
- Architectural Framework Code: 20 points
- Status/Description of Program Code Completed to Date: 5 points
- Updated Project Documents and Time Sheets: 5 points
- Individual Team Member Cumulative Time Sheet: 5 points

### Docker Setup
To set up and run the project using Docker, follow these steps:

1. **Prerequisites**: Make sure you have Docker and Docker Compose installed on your machine.

2. **Clone the Repository**: Clone this repository to your local machine.

3. **Build the Docker Image**: Navigate to the project directory and run the following command to build the Docker image:
    ```
    docker-compose build
    ```

4. **Start the Containers**: Run the following command to start the containers:
    ```
    docker-compose up
    ```

5. **Initialize the Database**: The database will be automatically initialized when the container starts.

6. **Access the Application**: Open your web browser and navigate to `http://localhost:3000` to access the application.

7. **Stop the Containers**: To stop the containers, press `Ctrl+C` in the terminal where `docker-compose up` is running, or run the following command in another terminal:
    ```
    docker-compose down
    ```

That's it! You should now have the application running in a Docker container.
