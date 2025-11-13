### Japanese Language Support

- Claude should always respond in Japanese
- Comments and explanations should be written in Japanese

### External Tool Preferences

- For Atlassian operations (Jira, Confluence): Use CLI tools (acli) instead of MCP tools unless specifically instructed otherwise
  - When obtaining ticket information with acli, it is recommended to use the command as follows.
  - `acli jira workitem view <item name>`
- For GitHub operations: Use CLI tools (gh) instead of MCP tools unless specifically instructed otherwise
