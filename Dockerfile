# Use Python 3.12 as the base image
FROM python:3.12

# Set the working directory in the container to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Install New Relic Python agent
RUN pip install newrelic

# Expose port 8000
EXPOSE 8000

# Set environment variables for New Relic
ENV NEW_RELIC_ENVIRONMENT=production

# Run the application with New Relic
CMD ["newrelic-admin", "run-program", "python3", "app.py"]