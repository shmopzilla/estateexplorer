#!/bin/bash
# Load environment variables from .env file and run Figma MCP server

# Load .env file
if [ -f .env ]; then
    export $(cat .env | grep -v '^#' | xargs)
fi

# Run the MCP server
npx -y mcp-figma
