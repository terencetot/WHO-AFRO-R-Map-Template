# WHO AFRO Map Visualization Project

This project provides a dynamic and reusable framework for generating thematic maps of African regions based on WHO AFRO data. The framework is designed to allow flexibility in selecting variables, merging criteria, and color palettes, making it adaptable for various data visualization needs.

---

## **Project Structure**

- **`main.R`**: The main script that orchestrates the entire process. Configure your variables here to produce maps.

- **`data/`**: Contains the input data files, including shapefiles and Excel data.
  - `shapefiles/`: Shapefiles for the African continent, AFRO regions, and disputed areas.
  - `data_example.xlsx`: Example Excel file with data to visualize.

- **`Script/`**: Contains modular R scripts for specific tasks:
  - `config_and_import.R`: Handles configuration and data import.
  - `data_processing.R`: Cleans and merges data for visualization.
  - `visualization.R`: Generates maps based on the processed data.

---

## **Installation**

1. Clone this repository to your local machine:
   ```bash
   git clone https://github.com/terencetot/WHO-AFRO-R-Map-Template.git
   cd WHO_AFRO_Map_Project
