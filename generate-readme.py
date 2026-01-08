#!/usr/bin/env python3
"""
Script to generate a README.md file if one doesn't exist.
If a README.md already exists, it will skip generation.
"""

import os
import sys
import json

def main():
    # Get the directory where this script is located
    script_dir = os.path.dirname(os.path.abspath(__file__))
    readme_path = os.path.join(script_dir, 'README.md')
    
    # Check if README.md already exists
    if os.path.exists(readme_path):
        print('README.md already exists, skipping generation.')
        return 0
    
    # Load package.json to get project information
    package_json_path = os.path.join(script_dir, 'package.json')
    try:
        with open(package_json_path, 'r') as f:
            package_data = json.load(f)
    except FileNotFoundError:
        print('Error: package.json not found.')
        return 1
    except json.JSONDecodeError:
        print('Error: package.json is not valid JSON.')
        return 1
    
    # Get project name and license
    project_name = package_data.get('name', 'Project')
    license_type = package_data.get('license', 'MIT')
    
    # Generate README content
    readme_content = f"""# {project_name}

## Description
This project demonstrates how to setup `ts-jest`, `babel` to work together with `jest`.

## Installation
Run `npm install` or `yarn` to install dependencies.

## Usage
Run tests with:
```bash
npm test
```

## License
{license_type}
"""
    
    # Write README.md
    try:
        with open(readme_path, 'w') as f:
            f.write(readme_content)
        print('README.md generated successfully.')
        return 0
    except Exception as e:
        print(f'Error writing README.md: {e}')
        return 1

if __name__ == '__main__':
    sys.exit(main())
