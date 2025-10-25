# WorldCupGuide API

## Descripcion del Proyecto

El proposito del proyecto es proporcionar una guia de hoteles cercanos de su localidad, como funcion para los turistas del proximo mundial, permitiendo a los usuarios interactuar con reservas y reseñas.
Utiliza las siguientes tecnologias:
* **Backend:** .NET 8.0.
* **Base de Datos:** MySQL, gestionada a través de Docker.
* **ORM:** Entity Framework Core para la interacción con la base de datos.
* **Autenticación:** Implementa autenticación basada en **JWT** (JSON Web Tokens).
* **Contraseñas:** Las contraseñas se gestionan de forma segura con la librería BCrypt.Net-Next.
* **Documentación de API:** Incluye documentación interactiva de la API con **Swagger/OpenAPI**.

## Estructura del Proyecto (Back):

- **ProyectoWeb2/**: Carpeta principal que contiene el código fuente de la página.
    - `Controllers/`: Contiene las clases que manejan las solicitudes HTTP (API endpoints).
    - `Dtos/`: Carpeta que contiene los objetos de transferencia de datos, como los modelos para el registro y el inicio de sesión.
    - `Migrations/`: Contiene los archivos de migración de Entity Framework Core, que gestionan el esquema de la base de datos.
    - `Models/`: Es la carpeta que contiene todas las clases de modelo que representan las entidades de la base de datos.
    - `Views/`: Contiene todas las vistas del HTML.
    - `Program.cs`: Archivo de entrada de la aplicación, donde se configura la base de datos y la autenticación.
    - `ProyectoWeb2.csproj`: El archivo del proyecto que define las dependencias.

- **docker-compose.yml**: Define los servicios para la aplicación (.NET) y la base de datos (MySQL) para ser ejecutados con Docker.

- **Dockerfile**: Contiene las instrucciones para construir la imagen de Docker de la aplicación .NET.

## Estructura del Proyecto (Front):

- **ProyectWeb2/**: Carperta princpal del codigo.
    - *wwwroot/*: Carpeta donde contiene toda la parte del Front-End.
        - `css/`: Carpeta donde contiene todos los estilos .css que hay, precisamente para darle estilo a la página.
        - `js/`: Carpeta donde contiene todos la parte logica para la funcion de la propia página, archivos .js.
        - `lib/`: Carpeta para el uso de todas las librerias que se utilizaron en la parte del Front, como los querys que se utilizarán, como el bootstrap.
        - `index.html`: Página principal donde se aprecian los estadios que seran sedes del mundial.
        - `login.html`: Página donde se podra logear para poder acceder a la página principal.
        - `register.html`: Página donde se hacer su propia cuenta para acceder a la misma página.
        - `stadium.html`: Página donde se encuentran los hoteles y atracciones que esten cerca de los estadios seleccionados.
