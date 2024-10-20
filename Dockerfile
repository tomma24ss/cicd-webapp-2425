# Dockerfile
# 1. Use the Alpine version of Node.js for a smaller image.
FROM node:20-alpine

# 2. Set the working directory inside the container.
WORKDIR /app

# 3. Copy the package.json and yarn.lock to the container first.
COPY package.json yarn.lock ./

# 4. Install the application dependencies.
RUN yarn install --frozen-lockfile

# 5. Copy the application source code into the container.
COPY src/ src/
COPY tests/ tests/

# 6. Expose port 3000 to access the web application.
EXPOSE 3000

# 7. Start the web application using Yarn.
CMD ["yarn", "start"]
