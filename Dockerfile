# Use the official Ubuntu base image
FROM ubuntu:24.04

# Set environment variable to avoid interactive prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Update package list and install prerequisites
RUN apt-get update && \
    apt-get install -y ansible\
    && apt-get clean

WORKDIR /playbook
COPY setup.yaml .
ENTRYPOINT ["ansible-playbook"]
# CMD []
CMD ["-i", "localhost,", "setup.yaml"]





