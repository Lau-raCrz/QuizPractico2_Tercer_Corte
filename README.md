# QuizPractico2_Tercer_Corte
## Despliegue del Entorno E1

Este proyecto corresponde al despliegue del entorno E1 del repositorio PyBullet Industrial Robotics Gym utilizando Docker.
El objetivo fue ejecutar el entorno de simulación de un brazo robótico industrial en un contenedor, con soporte para visualización gráfica (PyBullet GUI) y sin depender de conexión a Internet durante la construcción.

## Construcción de la imagen

Desde un entorno virtual se prepararp dependencias offline.Esto descarga todos los paquetes necesarios en la carpeta wheels/.

```
pip download -r requirements.txt -d wheels
```
y para construir la imagen 

```
docker build --no-cache -t robotics-e1 .
```

## Ejecución con entorno gráfico

Primero conceder permiso al servidor X11:

```
xhost +local:root

```

Ejecutar el contenedor con acceso gráfico:
```
docker run -it --rm \
    -e DISPLAY=$DISPLAY \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    robotics-e1
```
