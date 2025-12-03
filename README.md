# A project to demonstrate how to setup `ts-jest`, `babel` to work together with `jest`

## Installation
Run `yarn` to install dependencies

## Overview about configuration
The project contains:
- A `babel.config.js` which contains babel config.
- A `jest.config.js` which contains config for `ts-jest` to read `babel` config.
- A `tsconfig.json` which contains config for `typescript`.

## Code Formatting Standards

### package.json Formatting
This repository follows standardized `package.json` formatting conventions:

- **Indentation**: Tab indentation is used throughout the file
- **Scripts Section**: All keys within the `scripts` section are alphabetically sorted by script name
- **Validation**: All `package.json` files are validated to ensure they remain valid JSON

### Editor Configuration
The repository includes:
- `.editorconfig` - Specifies tab indentation for `package.json` and other JSON files
- `.prettierrc` - Configures Prettier to use tabs for formatting

These configurations ensure consistency across different editors and development environments.
