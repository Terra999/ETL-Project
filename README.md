# ETL-Project

These are the instructions to run our ETL Project for Data Visualization Bootcamp:
1. Clone specified repository to your local machine.
2. Open a terminal or gitbash window at your local repository and type “source activate PythonData”, run, then type “jupyter notebook”, and run once more. 
3. Open PGAdmin and create a database named “etl_db”. Open a new query and run the schema file included in the repository based on the instructions included in the schema file.
4. Create a config.py file with your PostgreSQL information in order to securely run the Jupyter notebook to create the engine. 
    Note: This file should contain the following values: user, password, host, port, and database. 
5. Open the Jupyter notebook file named “ETL Project.ipynb” and run all cells. 
6. As proof of concept, run the view at the bottom of the schema file in PGAdmin.
