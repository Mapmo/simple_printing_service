FROM python:3.9-slim
RUN apt-get update && apt-get install -y procps
WORKDIR /app
COPY simple_printing_service.py /app
ENV DEFAULT Working with default!

CMD ["python", "simple_printing_service.py"]