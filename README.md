# SSP UI Service

This is the frontend web application for the Smart Shop Platform. It is a modern Single-Page Application (SPA) built with React.

## Core Responsibilities & Features

1.  **User Interface:**
    *   Provides the primary interface for customers to browse products, manage their cart, and place orders.
    *   Will eventually include separate dashboards for Admin and Business users to manage products and users.

2.  **API Interaction:**
    *   All dynamic data is fetched by making HTTP requests to the central `ssp-api-gateway`.
    *   The UI is completely decoupled from the backend services; it has no direct access to databases or other internal resources.

3.  **Authentication:**
    *   Handles the login flow by sending user credentials to the API gateway.
    *   Stores the received JWT (JSON Web Token) securely in the browser (e.g., in an HttpOnly cookie or local storage).
    *   Attaches the JWT to the `Authorization` header for all subsequent requests to protected API endpoints.

## Architecture
- **Framework:** **React** (with TypeScript)
- **Build Tool:** **Vite** for fast development and optimized builds.
- **Testing:** **Jest** and **React Testing Library** for unit and component testing.
- **Deployment:**
    *   The application is built into static HTML, CSS, and JavaScript files.
    *   These static files are deployed to an **Amazon S3 bucket**.
    *   The S3 bucket is served globally with low latency via an **Amazon CloudFront** distribution.

## Local Development

1.  **Prerequisites:** Node.js and npm (or yarn) must be installed.
2.  Navigate to this directory: `cd ssp-ui-service`
3.  Install dependencies:
    ```bash
    npm install
    ```
4.  Run the development server:
    ```bash
    npm run dev
    ```
    This will start the application, typically on `http://localhost:5173`.

## Testing

To run the unit and component tests, use the following command:
```bash
npm test
```
This will start Jest in watch mode.
