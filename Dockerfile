FROM python:3.13
WORKDIR /app
COPY app/backend/requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY app/backend /app/backend
COPY app/frontend /app/frontend
WORKDIR /app/backend
CMD ["python", "main.py"]
