# Passo 1: Imagem base minimalista de Python com Alpine Linux
FROM python:3.9-alpine

# Passo 2: Estabelecer o diretorio de trabalho isolado dentro do container
WORKDIR /app

# Passo 3: Copiar o requirements e instalar dependencias sem salvar cache em disco
COPY requirements.txt requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Passo 4: Copiar o restante do codigo fonte do microsservico
COPY app.py app.py

# Passo 5: Expor a porta logica do container
EXPOSE 5000

# Passo 6: Comando padrao iniciando a API via Gunicorn WSGI Server em nivel de producao
CMD ["gunicorn", "--bind", "0.0.0.0:5000", "app:app"]
