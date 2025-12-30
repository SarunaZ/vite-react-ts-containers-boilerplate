# App Project

A modern React application built with TypeScript, Vite, and the React Compiler.

## Tech Stack

- **Frontend Framework:** React 19.2.0
- **Language:** TypeScript 5.9.3
- **Build Tool:** Vite 7.2.4
- **Package Manager:** Yarn 4.6.0 (PnP mode)
- **Linting/Formatting:** Biome 2.3.10
- **Compiler:** React Compiler (babel-plugin-react-compiler)
- **Runtime:** Node.js 24
- **Container:** Docker & Docker Compose

## Prerequisites

Choose one of the following setups:

### Option 1: VS Code Dev Container (Recommended)
- Docker
- VS Code with Remote - Containers extension

### Option 2: Local Development
- Node.js 24+
- Corepack enabled (`corepack enable`)

## Getting Started

> [!IMPORTANT]  
> **It is highly recommended to run the project inside of a VS Code Dev Container.**

### Initial Setup

If you're running multiple instances of this boilerplate, configure a unique port:

1. **Copy the environment file:**
   ```bash
   cp env.example .env
   ```

2. **Edit `.env` and change the port:**
   ```bash
   VITE_PORT=5174  # Or any other available port
   ```

> [!NOTE]  
> The default port is `5173`. Skip this step if you're only running one instance.

### Option 1: Using VS Code Dev Container

1. **Open in Dev Container:**
   - Open the project in VS Code
   - Press `F1` and select `Dev Containers: Reopen in Container`
   - The container will automatically run `yarn install` and `yarn setup:sdks`

2. **Start the development server:**
   ```bash
   yarn dev
   ```

3. **Access the application:**
   Open [http://localhost:5173](http://localhost:5173) (or your configured `VITE_PORT`)

### Option 2: Local Development

1. **Enable Corepack:**
   ```bash
   corepack enable
   ```

2. **Install dependencies:**
   ```bash
   yarn install --immutable
   ```

3. **Setup SDKs for IDE support:**
   ```bash
   yarn setup:sdks
   ```

4. **Start the development server:**
   ```bash
   yarn dev
   ```

5. **Access the application:**
   Open [http://localhost:5173](http://localhost:5173) (or your configured `VITE_PORT`)

## Available Scripts

- `yarn dev` - Start development server with hot reload
- `yarn build` - Build for production
- `yarn preview` - Preview production build locally
- `yarn check` - Run Biome linter and formatter checks
- `yarn format` - Auto-fix linting and formatting issues
- `yarn setup:sdks` - Generate Yarn SDKs for IDE support

## Project Structure

This project uses **Yarn Plug'n'Play (PnP)** instead of `node_modules`. Dependencies are stored in `.yarn/cache` with portable paths that work across host and container environments.

The `.yarn/sdks` directory contains TypeScript and editor integrations for proper IDE support with Yarn PnP.

## Features

- ⚡ **Vite** - Lightning-fast HMR and build times
- ⚛️ **React Compiler** - Automatic optimization of React components
- 🎨 **Biome** - Fast, unified linting and formatting
- 🐳 **Docker** - Consistent development environment
- 📦 **Yarn PnP** - Zero-install dependencies with better performance
- 🔒 **TypeScript** - Type safety and better developer experience

## Notes

### React Compiler

The React Compiler is enabled and will automatically optimize your React components. This may impact Vite dev and build performance. See [React Compiler documentation](https://react.dev/learn/react-compiler) for more information.

### Yarn PnP

This project doesn't use `node_modules`. If your editor shows import errors:
1. Make sure you've run `yarn setup:sdks`
2. In VS Code, select the workspace TypeScript version (`.yarn/sdks/typescript/lib`)
3. Reload the window if needed

### Docker Volumes

The docker-compose setup mounts `.yarn/cache` and `.yarn/sdks` as volumes to ensure SDK paths work correctly between host and container.
