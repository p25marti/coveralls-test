# AGENTS.md

This file serves as a central reference point for AI agents, automated tools, and developers to understand repository-specific context, architecture decisions, and integration points.

## Repository Context

### Project Purpose
This repository is a demonstration project showcasing how to configure `ts-jest`, `babel`, and `jest` to work together seamlessly in a TypeScript project. It serves as a reference implementation for developers looking to set up a similar testing infrastructure.

### Project Type
Testing configuration example / TypeScript utility library

### Key Objectives
- Demonstrate proper integration of TypeScript, Jest, and Babel
- Showcase optional chaining support through Babel plugins
- Provide coverage reporting capabilities via Coveralls integration
- Serve as a template for TypeScript projects using Jest with Babel transpilation

## Architecture Overview

### Technology Stack
- **Language**: TypeScript 4.7.4
- **Runtime**: Node.js (current version targeting)
- **Testing Framework**: Jest 28.1.3
- **Transpiler**: Babel 7.18.6
- **Type Checker**: ts-jest 28.0.6
- **Coverage**: Coveralls 3.1.1

### Key Dependencies
- `@babel/core`: Core Babel compiler
- `@babel/preset-env`: Smart preset for ES feature transpilation
- `@babel/preset-typescript`: TypeScript support for Babel
- `@babel/plugin-proposal-optional-chaining`: Optional chaining operator support
- `babel-jest`: Jest transformer using Babel
- `ts-jest`: TypeScript preprocessor with source maps for Jest

### Project Structure
```
/coveralls-test
├── foo.ts              # Main source file (example TypeScript code)
├── foo.spec.ts         # Test file for foo.ts
├── package.json        # Project dependencies and scripts
├── babel.config.js     # Babel configuration
├── jest.config.js      # Jest configuration with ts-jest preset
├── tsconfig.json       # TypeScript compiler options
├── coverage/           # Generated coverage reports
├── README.md           # Basic setup documentation
└── AGENTS.md          # This file
```

## Build and Test Commands

### Installation
```bash
# Install dependencies using Yarn (recommended)
yarn

# Or using npm
npm install
```

### Testing
```bash
# Run tests
yarn test
# Or
npm test

# Run tests with coverage
yarn test --coverage
# Or
npm test -- --coverage
```

### Build
This is a test configuration example repository and does not have a build step. TypeScript transpilation is handled by Babel through Jest during test execution.

## Key Entry Points

### Main Source Files
- `foo.ts`: Contains example TypeScript code demonstrating:
  - Interface definitions (`User` interface)
  - Optional chaining usage (`user?.isStoreOwner`)
  - Exported utility functions

### Test Files
- `foo.spec.ts`: Contains Jest tests demonstrating optional chaining functionality

### Configuration Entry Points
1. **jest.config.js**: Entry point for Jest configuration
   - Uses `ts-jest/presets/js-with-babel` preset
   - Enables Babel integration through `babelConfig: true`

2. **babel.config.js**: Entry point for Babel transpilation
   - Configures presets for environment and TypeScript
   - Enables optional chaining plugin

3. **tsconfig.json**: TypeScript compiler configuration
   - Target: ES2019
   - Module: CommonJS
   - Strict mode enabled

## Coding Standards and Conventions

### TypeScript Conventions
- **Strict mode**: Enabled in tsconfig.json
- **Module system**: CommonJS
- **Naming conventions**: 
  - Interfaces: PascalCase (e.g., `User`)
  - Functions: camelCase (e.g., `isStoreOwner`, `getName`)
  - Files: kebab-case for configs, camelCase for source files

### Testing Conventions
- Test files use `.spec.ts` extension
- Test structure follows Jest's `describe`/`test` pattern
- Tests are co-located with source files

### Code Style
- Arrow functions for exports
- Type annotations for function parameters
- Interface-based type definitions

## API and Service Dependencies

### External Services
- **Coveralls**: Code coverage reporting service
  - Used for tracking test coverage metrics
  - Integration via `coveralls` package

### Internal Dependencies
This is a standalone example project with no internal service dependencies.

### Build-time Dependencies
- Babel ecosystem for transpilation
- Jest ecosystem for testing
- TypeScript for type checking

## Repository-Specific Quirks and Gotchas

### Important Notes

1. **Dual Transpilation Setup**: This project uses both TypeScript (via ts-jest) and Babel
   - ts-jest processes TypeScript syntax
   - Babel handles modern JavaScript features (like optional chaining)
   - Both must be configured correctly for tests to run

2. **Optional Chaining Support**: 
   - Optional chaining (`?.`) requires `@babel/plugin-proposal-optional-chaining`
   - Without this plugin, the feature won't work even though TypeScript supports it
   - This demonstrates why Babel is needed alongside TypeScript in some cases

3. **Jest Configuration**:
   - Uses the `js-with-babel` preset from ts-jest
   - The `globals` configuration with `babelConfig: true` is critical
   - This tells ts-jest to respect the babel.config.js file

4. **Package Manager**: 
   - Both `yarn.lock` and `package-lock.json` are present
   - Yarn is the recommended package manager based on README.md
   - Use yarn for consistency

5. **No Build Output**: 
   - This is a test configuration example
   - No compiled output is generated
   - The `outDir: "lib"` in tsconfig.json is configured but not used in practice

6. **Coverage Directory**:
   - Coverage reports are generated in the `coverage/` directory
   - Not ignored by git (intentionally committed for demonstration)
   - Contains lcov, clover, and JSON formats

## Integration Points

### Testing Integration
- Jest is the primary testing framework
- ts-jest acts as the TypeScript preprocessor
- babel-jest provides additional transpilation

### Coverage Integration
- Coverage data is generated by Jest
- Exported in multiple formats (lcov.info, clover.xml, coverage-final.json)
- Can be uploaded to Coveralls for tracking

### CI/CD Considerations
- Tests can be run in any environment with Node.js installed
- No build step required before testing
- Coverage reports are automatically generated during test runs

## Related Documentation

- **README.md**: Basic installation and configuration overview
- **package.json**: Complete dependency list and available scripts
- **jest.config.js**: Inline comments explaining configuration options
- **Official Documentation**:
  - [Jest Documentation](https://jestjs.io/docs/en/configuration.html)
  - [ts-jest Documentation](https://kulshekhar.github.io/ts-jest/)
  - [Babel Documentation](https://babeljs.io/docs/)

## Development Workflow

### For Contributors
1. Install dependencies with `yarn`
2. Make changes to source files
3. Add/update tests in corresponding `.spec.ts` files
4. Run tests with `yarn test`
5. Ensure all tests pass before committing

### For AI Agents and Automated Tools
- This repository follows standard Node.js/TypeScript conventions
- All configuration is in standard locations (root directory)
- Test execution is via standard npm scripts (`test`)
- No custom build tools or unusual setup required
- Environment-agnostic (runs on any Node.js environment)

## Troubleshooting

### Common Issues

1. **Tests not running**: Ensure dependencies are installed with `yarn`
2. **Optional chaining errors**: Verify `@babel/plugin-proposal-optional-chaining` is installed
3. **TypeScript errors**: Check that `typescript` and `ts-jest` versions are compatible
4. **Jest config not found**: Ensure you're running commands from the repository root

### Debug Mode
```bash
# Run Jest in debug mode
node --inspect-brk node_modules/.bin/jest --runInBand
```

## Version Information

**Current Version**: 1.0.0  
**License**: MIT  
**Node.js Target**: Current (as specified in babel preset)  
**TypeScript Target**: ES2019  

---

*This AGENTS.md file is maintained as part of the repository documentation standards. Update this file when making significant architectural changes or adding new integration points.*
