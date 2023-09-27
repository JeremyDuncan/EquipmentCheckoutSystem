# Equipment Checkout System (ECS)

## DeVry-CEIS400 Course Project

### Overview
This repository contains all the source code for CEIS400. This focuses on the design and initial construction of the software project.

### Table of Contents
- [Deliverables](#deliverables)
- [Required Software](#required-software)
- [Lab Steps](#lab-steps)
- [Week 5 Project Submission](#week-5-project-submission)
- [Class Rubric](#class-rubric)
- [Docker Installation Guide](#docker-installation-guide)
- [Docker App Deployment Guide](#docker-app-deployment-guide)


### Deliverables
- Step 1: Create a software design.
- Step 2: Create a software design description (SDD) document (GRADED).
- Step 3: Prepare for construction.
- Step 4: Construct the architecture (GRADED).
- Step 5: Begin constructing the components (GRADED).
- Step 6: Update project documents, as needed.
- Step 7: Submit deliverables (IN ZIP FILE).

### Required Software
- Microsoft Visio
- Microsoft Word
- Microsoft Visual Studio
- Microsoft Project
- Git

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

### Week 5 Project Submission
Create a zipped archive containing the following files:
- Software Design Description (SDD)
- Source code for architectural framework
- Status and description of program code completed to date
- Latest version of the project plan, business problem scenario, and test plan, if necessary
- Individual team member cumulative time sheet

Submit the zipped file as per the instructions.

### Class Rubric
- Software Design Description: 35 points
- Architectural Framework Code: 20 points
- Status/Description of Program Code Completed to Date: 5 points
- Updated Project Documents and Time Sheets: 5 points
- Individual Team Member Cumulative Time Sheet: 5 points

# App Environment Setup

### Docker Installation Guide

#### MacOS

1. **Download Docker Desktop**: Visit the [Docker Desktop for Mac](https://hub.docker.com/editions/community/docker-ce-desktop-mac/) download page and download the installer.

2. **Install Docker Desktop**: Double-click the downloaded `.dmg` file and follow the installation instructions.

3. **Verify Installation**: Open a terminal and run `docker --version` to verify that Docker was installed correctly.

#### Linux (Ubuntu)

1. **Update Package Index**: Open a terminal and run `sudo apt update`.

2. **Install Dependencies**: Run `sudo apt install apt-transport-https ca-certificates curl software-properties-common`.

3. **Add Docker GPG Key**: Run `curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -`.

4. **Add Docker Repository**: Run `sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"`.

5. **Install Docker**: Run `sudo apt update` followed by `sudo apt install docker-ce`.

6. **Verify Installation**: Run `docker --version`.

#### Windows

1. **Download Docker Desktop**: Visit the [Docker Desktop for Windows](https://hub.docker.com/editions/community/docker-ce-desktop-windows/) download page and download the installer.

2. **Install Docker Desktop**: Double-click the downloaded `.exe` file and follow the installation instructions.

3. **Verify Installation**: Open a Command Prompt and run `docker --version`.

#### Common Post-Installation Steps

1. **Start Docker**: If not started automatically, launch Docker from the Applications menu.

2. **Test Docker**: Open a terminal or Command Prompt and run `docker run hello-world` to verify that Docker can pull and run images.



### Docker App Deployment Guide
To set up and run the project using Docker, follow these steps:

1. **Prerequisites**: Make sure you have Docker and Docker Compose installed on your machine.(See [Docker Installation Guide](#docker-installation-guide))

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
