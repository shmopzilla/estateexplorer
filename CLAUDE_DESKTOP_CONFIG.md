# Claude Desktop Configuration for Figma MCP

Your Figma access token has been configured in this repository. To use it with Claude Desktop, follow these steps:

## For Claude Desktop (Recommended)

### Step 1: Locate Your Claude Desktop Config File

Find the config file based on your operating system:

- **macOS**: `~/Library/Application Support/Claude/claude_desktop_config.json`
- **Windows**: `%APPDATA%\Claude\claude_desktop_config.json`
- **Linux**: `~/.config/Claude/claude_desktop_config.json`

### Step 2: Edit the Configuration

Open the file in a text editor. If it doesn't exist, create it.

Add or merge this configuration:

```json
{
  "mcpServers": {
    "figma": {
      "command": "npx",
      "args": ["-y", "mcp-figma"],
      "env": {
        "FIGMA_ACCESS_TOKEN": "YOUR_FIGMA_TOKEN_FROM_DOT_ENV_FILE"
      }
    }
  }
}
```

**IMPORTANT**: Replace `YOUR_FIGMA_TOKEN_FROM_DOT_ENV_FILE` with your actual Figma access token.

Your token is stored in the `.env` file in this repository. To view it:
```bash
cat .env
```

Copy the token value (starting with `figd_`) and paste it into your Claude Desktop config.

**Note**: If you already have other MCP servers configured, just add the "figma" entry to your existing "mcpServers" object.

### Step 3: Restart Claude Desktop

Completely quit and restart Claude Desktop for the changes to take effect.

### Step 4: Verify the Connection

In Claude Desktop, try asking:
- "Can you list my Figma files?"
- "What MCP servers are connected?"

## For Claude Code CLI

If you're using Claude Code from the command line, the token is already configured in the `.env` file in this repository. The MCP server will automatically use it.

## Security Notes

⚠️ **Important**:
- Your Figma access token is stored in the `.env` file (which is git-ignored)
- Never commit the `.env` file or share your token
- The token in the Claude Desktop config file is stored locally on your machine
- If you need to revoke access, go to your [Figma settings](https://www.figma.com/settings) and delete the personal access token

## Testing Your Setup

Once configured, you can interact with Figma through Claude:

### Example Prompts:

1. **List files**: "Show me my recent Figma files"
2. **File details**: "Get details about this Figma file: https://www.figma.com/file/[your-file-key]/[file-name]"
3. **Components**: "List all components in my Figma file"
4. **Colors**: "Extract color tokens from this Figma design"
5. **Export**: "Export this Figma component as SVG"

## Troubleshooting

If the connection doesn't work:

1. ✅ Verify you've restarted Claude Desktop
2. ✅ Check the token is correctly pasted (no extra spaces)
3. ✅ Ensure you have access to the Figma files you're querying
4. ✅ Try testing with a public Figma file first
5. ✅ Check Claude Desktop logs for MCP errors

### Viewing Claude Desktop Logs

- **macOS**: `~/Library/Logs/Claude/`
- **Windows**: `%APPDATA%\Claude\logs\`
- **Linux**: `~/.config/Claude/logs/`

Look for errors related to "figma" or "mcp" in the logs.
