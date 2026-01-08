#!/bin/bash
# Shell script wrapper to generate README.md if it doesn't exist
# This script can be used in CI/CD pipelines or as a pre-commit hook

set -e

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
README_PATH="${SCRIPT_DIR}/README.md"

# Check if README.md already exists
if [ -f "${README_PATH}" ]; then
    echo "README.md already exists, skipping generation."
    exit 0
fi

# Try to use Python script if available
if command -v python3 &> /dev/null; then
    python3 "${SCRIPT_DIR}/generate-readme.py"
    exit $?
fi

# Fallback: Generate a basic README directly
echo "Python not found, generating basic README..."

# Get project name from package.json if available
PROJECT_NAME="Project"
LICENSE="MIT"

if command -v jq &> /dev/null && [ -f "${SCRIPT_DIR}/package.json" ]; then
    PROJECT_NAME=$(jq -r '.name // "Project"' "${SCRIPT_DIR}/package.json")
    LICENSE=$(jq -r '.license // "MIT"' "${SCRIPT_DIR}/package.json")
elif [ -f "${SCRIPT_DIR}/package.json" ]; then
    # Simple grep fallback if jq is not available
    PROJECT_NAME=$(grep -Po '"name":\s*"\K[^"]*' "${SCRIPT_DIR}/package.json" 2>/dev/null || echo "Project")
    LICENSE=$(grep -Po '"license":\s*"\K[^"]*' "${SCRIPT_DIR}/package.json" 2>/dev/null || echo "MIT")
fi

# Generate README content
cat > "${README_PATH}" <<EOF
# ${PROJECT_NAME}

## Description
This project demonstrates how to setup \`ts-jest\`, \`babel\` to work together with \`jest\`.

## Installation
Run \`npm install\` or \`yarn\` to install dependencies.

## Usage
Run tests with:
\`\`\`bash
npm test
\`\`\`

## License
${LICENSE}
EOF

echo "README.md generated successfully."
exit 0
