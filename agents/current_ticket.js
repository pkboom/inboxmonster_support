const { execSync } = require("child_process");
const { McpServer } = require("@modelcontextprotocol/sdk/server/mcp.js");
const {
    StdioServerTransport,
} = require("@modelcontextprotocol/sdk/server/stdio.js");

const server = new McpServer({
    name: "weather",
    version: "1.0.0",
    capabilities: {
        resources: {},
        tools: {},
    },
});

function currentTicket() {
    try {
        const branch = execSync("git branch --show-current", {
            encoding: "utf-8",
        }).trim();
        console.log(`Current Git branch: ${branch}`);
        const match = branch.match(/IN-\d+/);
        if (match) {
            const ticket = match[0];
            console.log(ticket); // Output: IN-6709
            return ticket;
        }
        return null;
    } catch (error) {
        console.error("Error running git command:", error);
        return null;
    }
}

server.tool("get-current-ticket", "Get current jira ticket", {}, async () => {
    return {
        content: [
            {
                type: "text",
                text: `Jira ticket is ${currentTicket()}`,
            },
        ],
    };
});

async function main() {
    const transport = new StdioServerTransport();
    await server.connect(transport);
    console.error("Jira ticket MCP Server running on stdio");
}

main().catch((error) => {
    console.error("Fatal error in main():", error);
    process.exit(1);
});
