# Use the official PostgreSQL image as the base
FROM postgres:latest

# Optional: Set environment variables
ENV POSTGRES_DB=practise
ENV POSTGRES_USER=dbuser
ENV POSTGRES_PASSWORD=dbpassword

# Optional: Copy custom initialization scripts
# COPY ./scripts/init.sh /docker-entrypoint-initdb.d/

# Create a directory inside the container
RUN mkdir -p /scripts

# Copy the contents of the local 'scripts' directory to the container
COPY scripts /scripts


# Expose the PostgreSQL port
EXPOSE 5432
