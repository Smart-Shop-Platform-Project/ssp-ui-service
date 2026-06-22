# --- Build Stage ---
# Use a Node.js base image to build the React application
FROM node:18-alpine as build

WORKDIR /app

# Copy package.json and package-lock.json first to leverage Docker cache
COPY package*.json ./
RUN npm install

# Copy the rest of the application code
COPY . .

# Build the static files
RUN npm run build

# --- Production Stage ---
# Use a lightweight Nginx server to host the static files
FROM nginx:1.25-alpine

# Copy the built static files from the 'build' stage
COPY --from=build /app/dist /usr/share/nginx/html

# Copy a custom Nginx configuration file
# This is important for single-page applications (SPAs)
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Expose port 80
EXPOSE 80

# The default Nginx command will start the server
CMD ["nginx", "-g", "daemon off;"]
