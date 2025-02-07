#!/bin/bash

# Function to check if virtual environment exists
check_venv() {
    if [ ! -d "venv" ]; then
        echo "Virtual environment not found. Please run setup_flowchart.sh first."
        exit 1
    fi
}

# Function to generate flowcharts
generate_flowchart() {
    local file=$1
    local format=$2
    
    # Activate virtual environment
    source venv/bin/activate

    case $format in
        "png")
            echo "Generating PNG flowchart..."
            code2flow "$file" -o "flowchart_$(basename "$file" .py).png"
            ;;
        "html")
            echo "Generating HTML flowchart..."
            python -m pyflowchart "$file" -o "flowchart_$(basename "$file" .py).html"
            ;;
        "both")
            echo "Generating both PNG and HTML flowcharts..."
            code2flow "$file" -o "flowchart_$(basename "$file" .py).png"
            python -m pyflowchart "$file" -o "flowchart_$(basename "$file" .py).html"
            ;;
        *)
            echo "Invalid format. Please use 'png', 'html', or 'both'"
            deactivate
            exit 1
            ;;
    esac

    # Deactivate virtual environment
    deactivate
}

# Main script
echo "Flowchart Generator"
echo "-----------------"

# Check if virtual environment exists
check_venv

# Get the Python file
read -p "Enter the Python file name (e.g., main.py): " python_file

# Check if file exists
if [ ! -f "$python_file" ]; then
    echo "Error: File '$python_file' not found!"
    exit 1
fi

# Get the output format
echo "Select output format:"
echo "1. PNG format"
echo "2. HTML format"
echo "3. Both formats"
read -p "Enter your choice (1/2/3): " choice

case $choice in
    1) format="png" ;;
    2) format="html" ;;
    3) format="both" ;;
    *) echo "Invalid choice"; exit 1 ;;
esac

# Generate the flowchart
generate_flowchart "$python_file" "$format"

echo "Flowchart generation complete!"
