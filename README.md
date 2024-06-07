Aquí tienes el archivo `README.md` con la información actualizada sobre la conexión a la base de datos utilizando XAMPP:

# Chaucherita

## Descripción

**Chaucherita** es una aplicación web desarrollada en Java que permite a los usuarios gestionar sus finanzas personales de manera eficiente. Los usuarios pueden realizar un seguimiento de sus ingresos, gastos, presupuestos y generar informes financieros detallados.

## Características

- **Gestión de Ingresos y Gastos**: Permite registrar y categorizar ingresos y gastos.
- **Interfaz Amigable**: Interfaz intuitiva y fácil de usar.

## Requisitos

- **Java 11** o superior
- **Maven** para la gestión de dependencias
- **Apache Tomcat 9** o superior
- **MySQL** para la base de datos (se recomienda usar **XAMPP**)
- **IDE** como IntelliJ IDEA o Eclipse

## Instalación

### Paso 1: Clonar el repositorio

```sh
git clone https://github.com/SlaytherZR/Chaucherita.git
```

### Paso 2: Configurar la base de datos

1. Descargar e instalar [XAMPP](https://www.apachefriends.org/index.html).

2. Iniciar el servidor MySQL desde el panel de control de XAMPP.

3. Crear una base de datos en MySQL:

```sql
CREATE DATABASE chaucherita;
```

4. Configurar archivo persistence.xml
```sh
src/main/java/META-INF/persistence.xml```


### Paso 4: Compilar y ejecutar la aplicación

1. Navegar al directorio del proyecto:

```sh
cd chaucherita
```

2. Compilar el proyecto usando Maven:

```sh
mvn clean install
```

3. Desplegar la aplicación en Apache Tomcat:

- Copiar el archivo WAR generado en `target/chaucherita.war` al directorio `webapps` de Tomcat.
- Iniciar el servidor Tomcat.

### Paso 5: Acceder a la aplicación

Abrir un navegador web y navegar a:

```
http://localhost:8080/chaucherita
```
