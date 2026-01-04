# Estate Explorer

Estate Explorer with Figma MCP integration for accessing Figma designs.

## Setup

### 1. Install Dependencies

```bash
npm install
```

### 2. Get Your Figma Access Token

1. Go to [Figma Account Settings](https://www.figma.com/settings)
2. Scroll down to "Personal access tokens"
3. Click "Create a new personal access token"
4. Give it a name (e.g., "Estate Explorer MCP")
5. Copy the generated token

### 3. Configure Claude Code with Figma MCP

To use the Figma MCP server with Claude Code, you need to add the configuration to your Claude settings:

#### For Claude Desktop:

1. Open your Claude configuration file:
   - **macOS**: `~/Library/Application Support/Claude/claude_desktop_config.json`
   - **Windows**: `%APPDATA%\Claude\claude_desktop_config.json`
   - **Linux**: `~/.config/Claude/claude_desktop_config.json`

2. Add the Figma MCP server configuration:

```json
{
  "mcpServers": {
    "figma": {
      "command": "npx",
      "args": ["-y", "mcp-figma"],
      "env": {
        "FIGMA_ACCESS_TOKEN": "your_figma_access_token_here"
      }
    }
  }
}
```

3. Replace `your_figma_access_token_here` with your actual Figma access token
4. Restart Claude Desktop

#### For Claude Code CLI:

Use the provided `mcp-config.json` in this repository:

1. Copy `.env.example` to `.env`:
   ```bash
   cp .env.example .env
   ```

2. Edit `.env` and add your Figma access token:
   ```
   FIGMA_ACCESS_TOKEN=your_actual_token_here
   ```

3. The MCP server configuration is in `mcp-config.json`

### 4. Verify the Connection

Once configured, you can interact with Figma through Claude:

- "Show me the Figma file [file-key]"
- "Get components from Figma project [project-id]"
- "Export assets from Figma design [design-url]"

## Figma MCP Features

This project uses the `mcp-figma` server to interact with Figma designs directly. The MCP server provides:

- Access to Figma files and projects
- Component and style retrieval
- Asset export capabilities
- Design token extraction

## Troubleshooting

If the Figma MCP server doesn't connect:

1. Verify your Figma access token is valid
2. Check that the token has the necessary permissions
3. Restart Claude Desktop/Code after configuration changes
4. Check the MCP server logs for errors
