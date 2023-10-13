# Use a base image with Flutter pre-installed
FROM cirrusci/flutter:2.2.3

# Set the working directory
WORKDIR /app

# Copy the pubspec.yaml file
#COPY pubspec.yaml /app/

# Copy the entire Flutter project to the container
COPY . /app/

# Install Flutter dependencies
#RUN flutter pub get

# Copy the rest of the Flutter web build to the container
COPY build/web/ /app/web/

# Expose the desired port (e.g., 80)
EXPOSE 80

# Start a web server to serve the Flutter app
CMD ["flutter", "run", "-d", "linux"]
