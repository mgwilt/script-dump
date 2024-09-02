# This script automates the creation and activation of a Conda environment based on the 'environment.yml' file.

$envFilePath = "environment.yml"

# Function to get the Conda environment name from the environment.yml file
function Get-CondaEnvName {
    param (
        [string]$filePath
    )
    
    if (-not (Test-Path $filePath)) {
        Write-Host "Error: The file '$filePath' does not exist."
        exit 1
    }

    $content = Get-Content $filePath
    foreach ($line in $content) {
        if ($line -match "^name:\s*(\S+)") {
            return $matches[1]
        }
    }

    Write-Host "Error: Unable to find the environment name in '$filePath'."
    exit 1
}

# Function to check if a Conda environment exists
function CondaEnvExists {
    param (
        [string]$envName
    )

    $condaInfo = & conda info --envs
    return $condaInfo -match "^\s*$envName\s"
}

# Function to create and activate the Conda environment
function CreateAndActivateCondaEnv {
    param (
        [string]$envFilePath
    )
    
    # Check if Conda is installed
    if (-not (Get-Command conda -ErrorAction SilentlyContinue)) {
        Write-Host "Error: Conda is not installed or not found in the system PATH."
        exit 1
    }

    $envName = Get-CondaEnvName -filePath $envFilePath

    if (-not (CondaEnvExists -envName $envName)) {
        Write-Host "Creating Conda environment: $envName"
        & conda env create -f $envFilePath -ErrorAction Stop
    } else {
        Write-Host "Conda environment '$envName' already exists."
    }

    Write-Host "Activating Conda environment: $envName"
    & conda activate $envName
}

CreateAndActivateCondaEnv -envFilePath $envFilePath
