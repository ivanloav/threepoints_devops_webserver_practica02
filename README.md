# Proyecto de pruebas de DevOps

Proyecto node de pruebas para usarlo como modelo en un ciclo CI/CD de DevOps para la asignatura de DevOps del Master de Fullstack de Threepoints

## Install

Para ejecutarlo, hace falta instalarlo como un docker estándar:

```bash
$: docker build --tag node_devops .
$: docker run -d -p 8090:8090 -it node_devops
```

Esto abrirá en el puerto 8090 (Se puede cambiar con el parámetro `PORT` en el `.env`) un webserver genérico de nodejs, un Hello World, que usaremos para los despliegues de DevOps.

## Parametrize

- `PORT` Para determinar en qué puerto se ejecuta el servidor. Default=8090