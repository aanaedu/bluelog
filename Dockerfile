FROM python:3.9.9

WORKDIR /app

COPY . /app/

# Install packages from requirements.txt
# hadolint ignore=DL3013
RUN pip install --upgrade --no-cache-dir pip &&\
    pip install --trusted-host pypi.python.org --no-cache-dir -r requirements.txt

# load fake data
RUN flask forge

# Expose port 80
EXPOSE 80

# Run app.py at container launch
CMD [ "flask", "run", "--host=0.0.0.0", "--port=80" ]
