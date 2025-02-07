# nano setup_flowchart.sh
# bash setup_flowchart.sh

#!/bin/bash

# 1. Update system and install dependencies
echo "Updating system and installing dependencies..."
sudo apt update
sudo apt install -y python3 python3-pip python3-venv graphviz

# 2. Create and activate virtual environment
echo "Creating and activating virtual environment..."
python3 -m venv venv
source venv/bin/activate

# 3. Install necessary Python packages
echo "Installing Code2Flow, pyan3, and pyflowchart..."
pip install --upgrade pip
pip install code2flow pyan3 pyflowchart

# 4. Verify Graphviz installation
echo "Verifying Graphviz installation..."
dot -V

# 5. Ask for the Python file name (default: main.py)
read -p "Enter the Python file name (default: main.py): " filename
filename=${filename:-main.py}  # Use 'main.py' if input is empty

# 6. Ask the user if they want to generate flowcharts now
read -p "Do you want to generate flowcharts now? (y/n): " generate_now

if [[ "$generate_now" =~ ^[Yy]$ ]]; then
    # 7. Ask user for the desired output format
    echo "Select an option:"
    echo "1. Generate flowchart.png (Code2Flow)"
    echo "2. Generate flowchart.html (PyFlowchart)"
    echo "3. Generate both flowchart.png and flowchart.html"
    read -p "Enter your choice (1, 2, or 3): " choice

    if [ "$choice" == "1" ]; then
        echo "Generating flowchart using Code2Flow..."
        code2flow "$filename" -o flowchart.png
        echo "Flowchart saved as flowchart.png"

    elif [ "$choice" == "2" ]; then
        echo "Generating HTML flowchart using PyFlowchart..."
        python -m pyflowchart "$filename" -o flowchart.html
        echo "Flowchart saved as flowchart.html"

    elif [ "$choice" == "3" ]; then
        echo "Generating both flowchart.png and flowchart.html..."
        code2flow "$filename" -o flowchart.png
        python -m pyflowchart "$filename" -o flowchart.html
        echo "Flowcharts saved as flowchart.png and flowchart.html"

    else
        echo "Invalid choice. Please run the script again and choose either 1, 2, or 3."
        exit 1
    fi
else
    echo "Skipping flowchart generation. You can run the script later to generate flowcharts."
fi

echo "All tasks completed successfully!"
