# Dockerfile for frontend
FROM nginx:alpine

# Copy the build output to Nginx's default folder
COPY ./index.html /usr/share/nginx/html
COPY ./index.css /usr/share/nginx/html
COPY ./index.js /usr/share/nginx/html

# Expose port 80
EXPOSE 80
