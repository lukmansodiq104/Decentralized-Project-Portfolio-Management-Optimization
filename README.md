# Decentralized Project Portfolio Management Optimization

A comprehensive blockchain-based solution for managing project portfolios using Clarity smart contracts on the Stacks blockchain.

## Overview

This system provides a decentralized approach to project portfolio management with the following key features:

- **Portfolio Manager Verification**: Validates and manages certified portfolio managers
- **Project Prioritization**: Automated scoring and ranking of projects based on strategic value, urgency, and complexity
- **Resource Allocation**: Efficient distribution of budget, personnel, and equipment across projects
- **Risk Assessment**: Comprehensive risk evaluation with mitigation planning
- **Value Optimization**: ROI calculation and portfolio optimization strategies

## Architecture

The system consists of five interconnected smart contracts:

### 1. Portfolio Manager Verification (`portfolio-manager-verification.clar`)
- Manages verification of portfolio managers
- Stores manager credentials and experience
- Controls access to other contract functions

### 2. Project Prioritization (`project-prioritization.clar`)
- Creates and manages projects
- Calculates priority scores based on multiple factors
- Enables dynamic priority updates

### 3. Resource Allocation (`resource-allocation.clar`)
- Manages resource pools (budget, personnel, equipment)
- Allocates resources to projects based on priority
- Tracks resource utilization rates

### 4. Risk Assessment (`risk-assessment.clar`)
- Evaluates technical, financial, timeline, and market risks
- Calculates overall risk scores
- Manages mitigation plans

### 5. Value Optimization (`value-optimization.clar`)
- Calculates expected and actual ROI
- Generates optimization suggestions
- Tracks portfolio performance

## Getting Started

### Prerequisites
- Stacks blockchain development environment
- Clarity CLI tools
- Node.js and npm for testing

### Installation

1. Clone the repository:
   \`\`\`bash
   git clone <repository-url>
   cd decentralized-portfolio-management
   \`\`\`

2. Install dependencies:
   \`\`\`bash
   npm install
   \`\`\`

3. Run tests:
   \`\`\`bash
   npm test
   \`\`\`

### Deployment

1. Deploy contracts in the following order:
    - `portfolio-manager-verification.clar`
    - `project-prioritization.clar`
    - `resource-allocation.clar`
    - `risk-assessment.clar`
    - `value-optimization.clar`

2. Initialize the system:
    - Verify initial portfolio managers
    - Initialize resource pools
    - Set portfolio targets

## Usage Examples

### Verifying a Portfolio Manager
\`\`\`clarity
(contract-call? .portfolio-manager-verification verify-manager 'SP1234... u5 "PMP Certified")
\`\`\`

### Creating a Project
\`\`\`clarity
(contract-call? .project-prioritization create-project "Mobile App Development" u8 u7 u6)
\`\`\`

### Allocating Resources
\`\`\`clarity
(contract-call? .resource-allocation allocate-resources u1 u50000 u5 u2)
\`\`\`

### Assessing Risk
\`\`\`clarity
(contract-call? .risk-assessment assess-project-risk u1 u2 u1 u3 u2 "Regular code reviews and testing")
\`\`\`

### Calculating Value
\`\`\`clarity
(contract-call? .value-optimization calculate-project-value u1 u100000 u50000 u12)
\`\`\`

## Key Features

### Automated Prioritization
Projects are automatically scored based on:
- Strategic value (40% weight)
- Urgency (30% weight)
- Complexity (30% weight, inverse)

### Risk Management
Four-dimensional risk assessment:
- Technical Risk
- Financial Risk
- Timeline Risk
- Market Risk

### Resource Optimization
- Real-time resource tracking
- Utilization rate monitoring
- Automatic allocation validation

### Value Tracking
- Expected vs. actual ROI comparison
- Portfolio performance metrics
- Optimization recommendations

## Security Considerations

- All critical functions require verified portfolio manager status
- Resource allocation includes availability checks
- Risk assessments are timestamped and attributed
- Value calculations include input validation

## Testing

The project includes comprehensive tests using Vitest:

\`\`\`bash
npm test                    # Run all tests
npm run test:watch         # Run tests in watch mode
npm run test:coverage      # Generate coverage report
\`\`\`

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests for new functionality
5. Submit a pull request

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Support

For questions and support, please open an issue in the GitHub repository.
