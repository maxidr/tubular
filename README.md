# Tubular

Requisitos del sistema

+ ruby 1.9.2 o superior (1.9.3 recomendado)
+ mysql

## Inicialización del proyecto

    gem install bundler
    bundle install

## Base de datos

El proyecto trabaja con el motor mysql

### Configuración de la conexión
  
La configuración de la conexión a la BBDD se encuentra en config/database.yml

### Inicialización de la BBDD

Para generar la base de datos se debe ejecutar lo siguiente

    # Crea la base de datos si no existe
    rake db:create RAILS_ENV=production

    # Genera las tablas necesarias
    rake db:migrate RAILS_ENV=production

## Despliegue del proyecto

Para correr el sistema de forma rápida y sencilla
    
    rails s -e production

Para desplegar en un ambiente de producción se recomienda utilizar [Phusion Passenger](https://www.phusionpassenger.com/) junto a Apache o Nginx.  Los pasos para instalar y configurar phusion passenger son los [estos](https://www.phusionpassenger.com/download/#open_source).


