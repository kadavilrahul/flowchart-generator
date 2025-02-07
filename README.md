# Flowchart Generator Setup

A streamlined setup for generating flowcharts. This tool helps automate the process of creating flowcharts in html and png format. Useful for AI workflows

#### Overview

This project provides an automated setup that:
- Command line based flowchart generation environment
- Handles all dependencies and configurations automatically

#### System Requirements

- Linux system with GUI (GUI needed to view files)

#### Tested on:
- Ubuntu 24.04 LTS

**Note:** This setup should work on most other Linux distributions with minimal modifications. For headless servers, ensure you have GUI access through a remote desktop solution.

## Installation Instructions 
(Run these command in your Linux terminal):

1. Clone and move files to the current directory:

```bash
git clone https://github.com/kadavilrahul/flowchart-generator.git flowchart-generator && mv flowchart-generator/setup_flowchart.sh flowchart-generator/generate.sh . && rm -rf flowchart-generator
```

2. First time setup and run script
```bash
bash setup_flowchart.sh
```
3. Rerun
```bash
bash generate.sh
```

## Features

- One-click setup and installation
- Automated dependency management
- Command line flowchart generation
- Easy-to-use command line interface
- Automatic environment configuration

## Usage

1. Run the setup script:
   ```bash
   bash setup_flowchart.sh
   ```

2. Follow the on-screen prompts for:
   - Initial setup preferences
   - Task specifications

3. The tool will automatically:
   - Set up the required environment
   - Install dependencies
   - Generate flowcharts

## Troubleshooting

If you encounter any issues:
1. Ensure all system requirements are met
2. Check your internet connection
3. Make sure GUI access is available

## Contributing

Feel free to contribute to this project by:
- Submitting bug reports
- Proposing new features
- Creating pull requests

## License

This project is open source and available under the MIT License.

---

For more information or support, please open an issue in the repository.
