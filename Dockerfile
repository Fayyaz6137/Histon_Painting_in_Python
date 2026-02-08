# Use lightweight Python image
FROM python:3.11-slim

# Install system dependencies needed for turtle (tkinter)
RUN apt-get update && apt-get install -y \
    python3-tk \
    tk \
    x11-apps \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy files
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY app.py .s

# Run the app
CMD ["python", "app.py"]
