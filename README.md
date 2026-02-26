# 📮 Ejemplo de Base de Datos de Códigos Postales de México en PostgreSQL

Este repositorio es un ejemplo educativo de cómo importar y estructurar los Códigos Postales de México en PostgreSQL usando el dataset oficial de **Correos de México**.

## 📂 ¿Qué incluye?

- Script para crear tablas (`estados`, `municipios`, `colonias`, `codigos_postales`)
- Script para importar datos masivos
- Uso de variables de entorno para conexión a PostgreSQL

## 📥 Fuente oficial de datos

Para obtener los datos actualizados debes descargarlos directamente desde el sitio oficial:

👉 [https://www.correosdemexico.gob.mx/SSLServicios/ConsultaCP/CodigoPostal_Exportar.aspx](https://www.correosdemexico.gob.mx/SSLServicios/ConsultaCP/CodigoPostal_Exportar.aspx)

Después de descargar el archivo:

1. Colócalo en la raíz del proyecto
2. Verifica que el nombre coincida con `CPdescarga.txt`
3. Asegúrate de que el archivo cumpla con el formato csv delimitado con **|**
4. Ejecuta el script de carga

## ⚙️ Instalación

```
pnpm install
```

## 🔐 Configuración

Copia `.env.template` a `.env` y configura tu conexión:

```env
DB_HOST=localhost
DB_PORT=5432
DB_USER=tu_usuario
DB_PASSWORD=tu_password
DB_NAME=tu_base_de_datos
```

## 🚀 Cargar los datos

```
pnpm run load-data
```

Este comando:

- Crea las tablas
- Importa los códigos postales
- Ejecuta todo dentro de una transacción

## 🎯 Objetivo

Este repositorio sirve como referencia para:

- Practicar importación masiva en PostgreSQL
- Entender normalización básica de datos geográficos
- Usarlo como base para una API futura
