# Use the official Nginx image
FROM nginx:alpine

# Copy your static files to the default Nginx directory
COPY . /usr/share/nginx/html

# Expose the default Nginx port
EXPOSE 80

# Start Nginx when the container launches
CMD ["nginx", "-g", "daemon off;"]
