FROM python:3.13
WORKDIR /app
COPY backend/requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY backend /app/backend
COPY frontend /app/frontend
WORKDIR /app/backend
CMD ["python", "main.py"]
