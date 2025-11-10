# Imagen base con soporte gráfico
FROM python:3.10-bullseye

# Evita preguntas en el build
ENV DEBIAN_FRONTEND=noninteractive

# Instala librerías necesarias para PyBullet con GUI (usa repos locales de Debian)
RUN apt-get update && apt-get install -y \
    python3-tk \
    libglu1-mesa \
    libx11-6 \
    libgl1 \
    libglib2.0-0 \
    && rm -rf /var/lib/apt/lists/*

# Carpeta de trabajo
WORKDIR /app

# Copiar wheels y requirements offline
COPY requirements.txt /app/
COPY wheels/ /wheels/

# Instalar dependencias desde wheels locales (sin Internet)
RUN pip install --no-index --find-links=/wheels -r /app/requirements.txt

# Copiar el código fuente
COPY . /app

# Rehabilita GUI (por si estaba en False)
RUN sed -i "s/'Enable_GUI': False/'Enable_GUI': True/" src/Industrial_Robotics_Gym/Environment/Core.py || true

# Asegura que src sea visible
ENV PYTHONPATH=/app/src

# Comando por defecto
CMD ["python", "run_E1.py"]

