FROM python:3.11-slim

WORKDIR /app

# Install Docker CLI (needed for docker exec commands)
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    docker.io \
    && rm -rf /var/lib/apt/lists/*

# Copy requirements file
COPY requirements.txt .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the exporter script
COPY exporter.py .

# Expose the metrics port
EXPOSE 9401

# Run the exporter
CMD ["python", "exporter.py"]
