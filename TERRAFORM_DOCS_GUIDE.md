# Quick Reference: terraform-docs Commands

This file provides quick commands for generating documentation using terraform-docs.

## Installation

### macOS
```bash
brew install terraform-docs
```

### Linux
```bash
# Download from releases
curl -sSLo ./terraform-docs.tar.gz https://terraform-docs.io/dl/latest/terraform-docs-latest-$(uname)-amd64.tar.gz
tar -xzf terraform-docs.tar.gz
chmod +x terraform-docs
sudo mv terraform-docs /usr/local/bin/
```

### Windows
```powershell
choco install terraform-docs
```

## Generate Documentation

### Single Directory
```bash
# Generate docs for current directory
terraform-docs .

# Generate docs for specific module
terraform-docs modules/global_resources
terraform-docs modules/global_resources/networking
terraform-docs modules/global_resources/security
terraform-docs modules/regional_resources
terraform-docs modules/regional_resources/networking
terraform-docs modules/regional_resources/logging
```

### All Directories (Recursive)
```bash
# From project root - generates docs for all modules
find . -name ".terraform-docs.yml" -execdir terraform-docs . \;
```

### Specific Directories Only
```bash
# Generate docs for all directories with .terraform-docs.yml
for dir in . modules modules/global_resources modules/global_resources/networking modules/global_resources/security modules/regional_resources modules/regional_resources/networking modules/regional_resources/logging; do
  echo "Generating docs for $dir"
  terraform-docs "$dir"
done
```

## Validation

### Check if docs are up-to-date
```bash
# This will exit with error if docs need updating
terraform-docs --check .
```

### CI/CD Integration
```bash
# Add to your CI pipeline
terraform-docs --check . || (echo "Documentation is out of date. Run 'terraform-docs .' to update." && exit 1)
```

## Formatting Options

The project uses these settings (already configured in .terraform-docs.yml):
- **Format**: Markdown tables
- **Sort**: By name
- **Mode**: Inject (updates README.md between markers)
- **Markers**: `<!-- BEGIN_TF_DOCS -->` and `<!-- END_TF_DOCS -->`

## Useful Options

### Preview without writing
```bash
terraform-docs --output-file /dev/stdout .
```

### Generate different formats
```bash
terraform-docs markdown table .         # Markdown tables (default)
terraform-docs markdown document .      # Markdown document
terraform-docs asciidoc table .        # AsciiDoc
terraform-docs json .                  # JSON
```

## Project-Specific Commands

### Generate all documentation
```bash
# From project root
cd /Users/corydonwood/Documents/GitHub/wlz-blog-platform-services

# Generate for root
terraform-docs .

# Generate for all modules
find modules -name ".terraform-docs.yml" -execdir terraform-docs . \;
```

### Verify all documentation
```bash
# Check root
terraform-docs --check .

# Check all modules
find modules -name ".terraform-docs.yml" -execdir sh -c 'terraform-docs --check . || exit 1' \;
```

## Git Pre-commit Hook

Create `.git/hooks/pre-commit`:
```bash
#!/bin/bash
set -e

echo "Checking Terraform documentation..."

# Run terraform-docs on all directories with config
find . -name ".terraform-docs.yml" -execdir terraform-docs . \;

# Add any updated README files
git add */README.md

echo "Documentation check complete!"
```

Make it executable:
```bash
chmod +x .git/hooks/pre-commit
```

## Makefile Integration

Add to your Makefile:
```makefile
.PHONY: docs docs-check

docs:
	@echo "Generating Terraform documentation..."
	@find . -name ".terraform-docs.yml" -execdir terraform-docs . \;
	@echo "Documentation generated!"

docs-check:
	@echo "Checking Terraform documentation..."
	@find . -name ".terraform-docs.yml" -execdir sh -c 'terraform-docs --check . || exit 1' \;
	@echo "Documentation is up to date!"
```

Usage:
```bash
make docs       # Generate documentation
make docs-check # Check if docs need updating
```

## Troubleshooting

### Documentation not updating?
- Ensure you're in the correct directory
- Check that .terraform-docs.yml exists
- Verify the markers exist in README.md: `<!-- BEGIN_TF_DOCS -->` and `<!-- END_TF_DOCS -->`

### Want to change format?
Edit the `.terraform-docs.yml` file in the relevant directory and change the `formatter` value.

### Need more customization?
See the full configuration options at: https://terraform-docs.io/user-guide/configuration/

