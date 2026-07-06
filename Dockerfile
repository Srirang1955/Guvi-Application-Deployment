FROM nginx:alpine
# Remove default nginx config
RUN rm /etc/nginx/conf.d/default.conf
# Copy custom config
COPY nginx.conf /etc/nginx/conf.d/
# Copy static files to nginx serving directory
COPY dist /usr/share/nginx/html
# Expose port 3000
EXPOSE 3000
# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
