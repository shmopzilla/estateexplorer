#!/bin/bash
# Start Claude Code CLI with Figma MCP environment variables loaded

# Load environment variables from .env file
if [ -f .env ]; then
    export $(cat .env | grep -v '^#' | xargs)
    echo "✓ Loaded Figma access token from .env"
    echo "✓ MCP server configured via .mcp.json"
    echo ""
    echo "You can now use Figma MCP in this session!"
    echo "Try: 'Can you read my Figma files?'"
else
    echo "Error: .env file not found"
    echo "Please create .env with your FIGMA_ACCESS_TOKEN"
    exit 1
fi

# Keep the environment variables in this shell session
exec $SHELL
