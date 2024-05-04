Este proyecto utiliza técnicas de webscraping con el paquete rvest en R para extraer datos automáticamente de sitios web. Se ha configurado un flujo de trabajo automatizado con GitHub Actions para ejecutar scripts regularmente. Este script forma parte del **curso Web Scraping y Automatización con R** ofrecido en [aprendetidyverse.com](https://aprendetidyverse.com/courses/web_scraping.html)

## Configuración del Entorno

Para asegurar que el entorno de trabajo esté correctamente configurado con las versiones adecuadas de los paquetes usados, sigue estos pasos:

1. Ejecuta el siguiente comando en R para instalar rvest:

```
install.packages("rvest")
```

Asegúrate de instalar cualquier otro paquete que tu script necesite de manera similar.

### Restablecer los paquetes:

Para replicar el entorno exacto usado en este proyecto, usa renv:

```
renv::restore()
```

### Personalización del Archivo de Configuración

Para adaptar este proyecto a tus necesidades específicas, especialmente si deseas monitorear diferentes sitios web o elementos, necesitarás modificar el archivo de configuración `.config.yml`. Este archivo contiene las configuraciones esenciales que definen qué sitios web y qué elementos específicos dentro de esos sitios deben ser monitoreados.

1. **Abrir el archivo `.config.yml`:**
   Localiza y abre el archivo `.config.yml` en tu editor de texto preferido.

2. **Modificar los parámetros:**
   Dentro del archivo, encontrarás secciones que especifican URLs de sitios web y los selectores XPath correspondientes para los elementos que deseas extraer. Actualiza estos valores según los sitios web y datos que necesitas monitorear.

3. **Guardar los cambios:**
   Una vez que hayas realizado las modificaciones necesarias, guarda el archivo. Asegúrate de que el formato del YAML esté correcto para evitar errores en la ejecución del script.

Al personalizar este archivo, puedes hacer que el proyecto se adapte mejor a tus objetivos de extracción de datos, permitiéndote monitorear una variedad más amplia de fuentes y datos de manera eficiente.


## Configuración de GitHub Actions

Para que el workflow de GitHub Actions funcione correctamente, necesitas configurar un GitHub Token y otorgarle permisos adecuados sobre el repositorio:

1. Crear un GitHub Token:
+ Ve a tu perfil de GitHub.
+ Accede a Settings > Developer settings > Personal access tokens.
+ Haz clic en Generate new token.
+ Selecciona los permisos necesarios para ejecutar acciones y acceder a repositorios.