FROM python:3.9-slim
WORKDIR /app
COPY print_service.py /app
ENV DEFAULT Working with default!

CMD ["python", "print_service.py"]