FROM python:3.9-slim

WORKDIR /app

COPY . /app

# Installe les dépendances nécessaires (pandas, numpy, pytest)
RUN pip install --upgrade pip && pip install -r requirements.txt

# Expose les fichiers si besoin (optionnel ici)
VOLUME ["/app/input_data.csv", "/app/output_data.csv"]

# Par défaut : exécute le test
CMD ["pytest", "test_etl.py"]

# Run the application (by default, run the main ETL process)
#CMD ["python", "etl.py"]

