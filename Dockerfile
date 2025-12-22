# Use Node.js with Corepack support (Debian-based for VS Code Server compatibility)
FROM node:24

# Enable Corepack
RUN corepack enable

# Set working directory
WORKDIR /app

# Enable Yarn 4 via Corepack
RUN corepack prepare yarn@stable --activate

# Copy Yarn configuration file
COPY .yarnrc.yml ./

# Copy package files
COPY package.json yarn.lock* ./

# Copy all source files (Yarn PnP needs to see the workspace)
# .dockerignore excludes .pnp.cjs and other generated files
COPY . .

# Install dependencies during build
RUN yarn install

# Install Yarn SDKs for IDE support (TypeScript, ESLint, etc.)
RUN yarn dlx @yarnpkg/sdks vscode

# Expose port
EXPOSE 5173

# Start the dev server (regenerate PnP files and SDKs if needed after volume mount)
CMD sh -c "yarn install && yarn dlx @yarnpkg/sdks vscode && yarn dev --host 0.0.0.0"

