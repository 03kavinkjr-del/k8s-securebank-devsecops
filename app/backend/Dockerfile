FROM python:3.12-slim

RUN useradd -m -u 1001 secureuser

WORKDIR /app

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY . .

RUN chown -R secureuser:secureuser /app

USER secureuser

HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 
CMD python -c "import urllib.request; urllib.request.urlopen('http://localhost:5000/health')" || exit 1

EXPOSE 5000

CMD ["gunicorn","-b","0.0.0.0:5000","app:app"]
