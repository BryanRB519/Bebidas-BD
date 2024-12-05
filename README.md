```markdown
# Viper - Local de Bebidas

Bienvenido a **Viper**, un sistema de gestión de base de datos para un local de bebidas. Este proyecto tiene como objetivo facilitar la administración de inventarios, ventas y clientes de un local de bebidas mediante una base de datos estructurada. Puedes conocer más sobre nuestro proyecto en [Viper - Proyecto Final](https://github.com/BryanRB519/Bebidas-BD).

---

## Tabla de Contenidos
- insert
- joins
- triggers
- store procedure
- funciones
- delete con y sin sub-consultas
- lo mismo de arriba pero con uptdate
- views
- usuarios con diversos permisos
- tablas tanto con triggers como sin triggers

---

## Descripción y Contexto
**Viper** es una herramienta de gestión para un local de bebidas que se encarga de organizar y almacenar información sobre el inventario de bebidas, ventas, clientes y proveedores mediante el uso de una base de datos. 

La aplicación permite:
- Registrar productos de bebidas.
- Gestionar el inventario en tiempo real.
- Gestionar clientes y proveedores.
- Realizar reportes de ventas y stock.

Este proyecto fue creado como parte de nuestro **proyecto final en bases de datos**, con el objetivo de proporcionar una solución eficiente para la gestión de un negocio de bebidas.

---

## Guía de Usuario
Para utilizar **Viper**, sigue estos pasos:

### 1. Iniciar sesión
Al abrir la aplicación, Si no tienes una cuenta, crea una cuenta de administrador.

### 2. Navegar por el panel de administración
El panel de administración te permitirá acceder a las siguientes funcionalidades:
- **Ventas**: Ver todas las ventas realizadas, generar reportes de ventas.
- **Inventario**: Ver el estado actual de las bebidas en stock y agregar o quitar productos.
- **Clientes**: Gestionar la información de los clientes (nombre, documento, edad y localidad).
- **Proveedores**: Agregar y gestionar proveedores de bebidas.

### 3. Realizar una venta
Selecciona los productos que deseas vender, ingresa los detalles de la venta y confirma el pago.

---

## Guía de Instalación
Sigue estos pasos para instalar y configurar el proyecto:

1. **Requisitos del Sistema Operativo**:
   - Sistema operativo: Linux, macOS o Windows
   - **MySQL**

2. **Clonación del repositorio**:
   git clone https://github.com/BryanRB519/Bebidas-BD.git
   ```


3. **Configuración de la base de datos**:
   - Crea una base de datos en MySQL.
   - usando los comandos create database [usando el nombre de la base de datos]
   - y debemos usar el comando use [usando el nombre de la base de datos]
   - ahora debemos quitar el modo seguro con este mismo comando SET SQL_SAFE_UPDATES= 0;

---

## Autor/es
- **Alex Marquez** - https://github.com/BryanRB519
- **Bryan Rojas** - https://github.com/BryanRB519

---

## Información Adicional
Este proyecto utiliza tecnologías como MySQL y se está desarrollando en el contexto de la gestión de bases de datos en aplicaciones comerciales. 

Enlace a documentación adicional o tecnologías relacionadas:
- [Documentación de MySQL](https://dev.mysql.com/doc/)

---

## Licencia
licencia para hacer bases de datos(es un chiste profe no nos desapruebe, pero si quiere no es chiste).

---

los programadores Alex Marquez y Bryan Rojas, no serán responsables de ningún daño, indemnización, o pérdida que pudiera surgir bajo cualquier teoría de responsabilidad (contrato, infracción, negligencia, racismo, etc.), incluyendo defectos en la herramienta digital o la pérdida de datos.

---

¡Gracias por usar y contribuir a **Viper**! 
este proyecto fue diseñado porque nos lo ordenaron no por el crustacio cascarudo.
