# Figma MCP Setup Guide for Estate Explorer

This guide will help you set up the Figma MCP (Model Context Protocol) server to connect your Estate Explorer project with Figma.

## What is MCP?

Model Context Protocol (MCP) is a standard for connecting AI assistants like Claude to external data sources and tools. The Figma MCP server allows Claude to interact directly with your Figma designs.

## Prerequisites

- Node.js and npm installed
- A Figma account with access to the designs you want to work with
- Claude Desktop or Claude Code installed

## Step-by-Step Setup

### Step 1: Install Dependencies

In your project directory, run:

```bash
npm install
```

This will install the `mcp-figma` package and its dependencies.

### Step 2: Obtain Your Figma Access Token

1. Log in to [Figma](https://www.figma.com/)
2. Go to your [Account Settings](https://www.figma.com/settings)
3. Scroll down to the **Personal access tokens** section
4. Click **Create a new personal access token**
5. Enter a name for your token (e.g., "Estate Explorer MCP")
6. Click **Create**
7. **Important**: Copy the token immediately - you won't be able to see it again!

### Step 3: Configure the MCP Server

#### Option A: For Claude Desktop

1. Locate your Claude Desktop configuration file:
   - **macOS**: `~/Library/Application Support/Claude/claude_desktop_config.json`
   - **Windows**: `%APPDATA%\Claude\claude_desktop_config.json`
   - **Linux**: `~/.config/Claude/claude_desktop_config.json`

2. Open the file in a text editor. If it doesn't exist, create it.

3. Add or merge this configuration:

```json
{
  "mcpServers": {
    "figma": {
      "command": "npx",
      "args": ["-y", "mcp-figma"],
      "env": {
        "FIGMA_ACCESS_TOKEN": "figd_YOUR_ACTUAL_TOKEN_HERE"
      }
    }
  }
}
```

4. Replace `figd_YOUR_ACTUAL_TOKEN_HERE` with your actual Figma access token from Step 2

5. Save the file and restart Claude Desktop

#### Option B: For Claude Code CLI

1. Run the setup script:

```bash
npm run setup
```

2. This creates a `.env` file. Open it and add your token:

```env
FIGMA_ACCESS_TOKEN=figd_YOUR_ACTUAL_TOKEN_HERE
```

3. The MCP configuration is already set up in `mcp-config.json`

### Step 4: Verify the Connection

Once configured, restart Claude Desktop or Claude Code and try these commands:

1. **List your Figma files**: "Can you list my recent Figma files?"
2. **Get file details**: "Show me details about this Figma file: [paste-file-url]"
3. **Extract components**: "What components are in this Figma file?"

## Figma File URLs and Keys

When working with Figma through MCP, you'll need file keys or URLs:

- **File URL format**: `https://www.figma.com/file/{file-key}/{file-name}`
- **File key**: The alphanumeric string in the URL (e.g., `abc123xyz789`)

## Available Capabilities

With the Figma MCP server connected, Claude can:

- ✅ Access Figma files and projects
- ✅ Read file structure and layers
- ✅ Extract component information
- ✅ Get design tokens (colors, typography, spacing)
- ✅ Export assets and images
- ✅ Read comments and annotations

## Troubleshooting

### "MCP server not found" or "Connection failed"

- Verify your Figma access token is correct
- Make sure the token hasn't expired
- Check that you've restarted Claude Desktop/Code after configuration
- Ensure Node.js and npx are available in your PATH

### "Permission denied" errors

- Verify your Figma token has access to the files you're trying to access
- Check that the file/project URL is correct
- Ensure you have the appropriate permissions in Figma

### Token permissions

Your Figma access token needs these permissions:
- Read access to files
- Read access to projects (if accessing projects)

## Security Notes

- **Never commit your `.env` file** to version control (it's in `.gitignore`)
- Store your Figma access token securely
- Don't share your token or configuration files
- Revoke tokens you're no longer using from Figma settings

## Next Steps

Now that your Figma MCP is connected, you can:

1. Ask Claude to analyze your Figma designs
2. Extract design tokens for your CSS/code
3. Generate component code from Figma components
4. Sync design changes with your codebase
5. Document your design system

## Resources

- [Figma API Documentation](https://www.figma.com/developers/api)
- [MCP Documentation](https://modelcontextprotocol.io/)
- [mcp-figma Package](https://www.npmjs.com/package/mcp-figma)

## Support

If you encounter issues:
1. Check this guide's troubleshooting section
2. Review the mcp-figma package documentation
3. Verify your Figma API access token permissions
4. Check Claude Desktop/Code logs for detailed error messages
