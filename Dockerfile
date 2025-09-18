# Use an official Python runtime as a parent image
FROM python:3.12-slim-bullseye

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file first
COPY requirements.txt /app/

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Make sure gunicorn is installed
RUN pip install gunicorn

# Copy the entire Django project into the container
COPY . /app/

# Expose the port Django will run on
EXPOSE 8000

# Run the Django application using Gunicorn
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "paymentProject.wsgi:application"]
# Replace 'paymentProject' with the name of your Django project folder
