# Use the official Node.js image as the base image
FROM node:14

# Set working directory
WORKDIR /20i-1788_frontend

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Build the React application
RUN npm run build

# Expose the application on port 1788
EXPOSE 1788

# Start the application
CMD ["npm", "start"]
