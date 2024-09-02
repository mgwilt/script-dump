## Overview

`activate.ps1` is a PowerShell script designed to automate the creation and activation of a Conda environment based on the `environment.yml` file. This script simplifies the process of setting up the required environment for your project.

## Prerequisites

- **Conda**: Ensure that Conda is installed and available in your system's PATH.
- **PowerShell**: This script is intended to be run in a PowerShell environment.

## Usage

2. **Prepare the `environment.yml` File**:
    Ensure that your `environment.yml` file is in the root directory of your project. An example `environment.yml` file might look like this:
    ```yaml
    name: resumate-poc
    channels:
      - defaults
    dependencies:
      - python=3.12
      - pip
      - pip:
        - streamlit
    ```

3. **Run the Script**:
    Open PowerShell and navigate to the directory containing `Activate-CondaEnvironment.ps1`. Execute the script by running:
    ```powershell
    .\Activate-CondaEnvironment.ps1
    ```

## Script Details

### Functions

- **Get-CondaEnvName**: Extracts the Conda environment name from the `environment.yml` file.
- **CondaEnvExists**: Checks if a Conda environment with the specified name already exists.
- **CreateAndActivateCondaEnv**: Creates the Conda environment if it does not exist and activates it.

### Error Handling

- The script checks if Conda is installed and available in the system PATH.
- It verifies the existence of the `environment.yml` file.
- It handles cases where the environment name is not found in the `environment.yml` file.

## Example

Here is an example of what the output might look like when running the script:
