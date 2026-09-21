# ✈️ Sistema de Reservas de Tiquetes en Aerolíneas: Gestión de Vuelos, Tarifas y Pasajeros

**Programa:** Bootcamp de Análisis de Datos — "Quiero Ser Digital (QFSD)" Phase II  
**Organización:** Corporación MAKAIA  
**Proyecto:** Proyecto Integrador  

---

## 📌 1. Descripción del Proyecto

El presente proyecto consiste en el diseño, implementación y análisis de un sistema de reservas de tiquetes aéreos relacional para una aerolínea comercial. La solución aborda desde la estructuración de la base de datos operativa hasta la generación de análisis de negocio clave (*Yield Management*, ocupación de asientos, comportamiento de demanda y perfilamiento sociodemográfico de pasajeros).

El sistema permite gestionar:
* **Programación Operativa:** Rutas, aeropuertos, horarios y asignación de flota.
* **Inventario y Capacidad:** Modelado de la flota de aviones y distribución física de asientos por cabinas (Primera, Business, Económica).
* **Gestión de Reservas (PNR):** Registro del segmento de vuelo que vincula al pasajero, la instancia específica de un vuelo, la tarifa asignada y el asiento.
* **Estrategia de Tarifas (Yield Management):** Diferenciación de precios y restricciones según cabina, demanda y anticipación de compra.
* **Información de Pasajeros:** Perfilamiento sociodemográfico, historial de viajes y preferencias de vuelo.

---

## 🎯 2. Objetivos del Proyecto

1. **Modelado de Datos (Entregable 1):** Diseñar un modelo Entidad-Relación y Relacional normalizado hasta la Tercera Forma Normal (3FN) que garantice la integridad de los datos y evite el *overbooking* no autorizado.
2. **Implementación de Base de Datos (Entregable 2):** Construir la estructura en SQL (DDL) y poblarla con un conjunto de datos consistente y representativo generado mediante scripts de Python (`Faker`, `Pandas`).
3. **Análisis de Datos y Dashboard (Entregable 3):** Crear un panel interactivo en Power BI para evaluar métricas de ocupación (*Load Factor*), eficiencia de precios (*Yield*) e ingresos por ruta, facilitando la toma de decisiones estratégicas.

---

## 🏗️ 3. Arquitectura y Modelo de Datos

El modelo relacional se divide en 5 núcleos funcionales:

1. **Geografía y Operación:** `Aeropuertos`, `Rutas`, `Vuelos_Programados`.
2. **Flota y Capacidad:** `Aviones`, `Distribucion_Asientos`.
3. **Precios y Tarifas:** `Tarifas_Clase`, `Precios_Instancia`.
4. **Pasajeros:** `Pasajeros` (información sociodemográfica, preferencias y contacto).
5. **Reservas y Tiempo Real:** `Instancias_Vuelo`, `Reservas` (PNR), `Segmentos_Vuelo`.

### Diagrama Entidad-Relación (ER)
> *[Insertar imagen o enlace al Diagrama ER del proyecto]*

---

## 📂 4. Estructura del Repositorio

```text
├── docs/
│   ├── Diagrama_ER.png             # Diagrama Entidad-Relación
│   └── Informe_de_Analisis.pdf     # Informe ejecutivo con hallazgos e interpretaciones
├── sql/
│   ├── 01_ddl_create_tables.sql    # Script de creación de esquemas, tablas y constraints
│   └── 02_queries_kpis.sql         # Consultas de análisis y métricas clave
├── src/
│   └── generate_data.py            # Script en Python para la generación sintética de datos
├── dashboard/
│   └── Dashboard_Reservas_Aerolinea.pbix  # Archivo de Power BI
├── .gitignore
└── README.md
```

## 🛠️ 5. Tecnologías Utilizadas
* **Base de Datos:** PostgreSQL / MySQL
* **Lenguajes:** SQL, Python 3.x
* **Librerías de Python:** Pandas, Faker, SQLAlchemy
* **Visualización:** Power BI
* **Control de Versiones:** Git & GitHub

## 📊 6. Preguntas de Negocio y KPIs Analizados
### El dashboard interactivo permite dar respuesta a los siguientes interrogantes del negocio:
* **Factor de Ocupación (Load Factor):** ¿Cuál es el porcentaje de asientos ocupados por ruta y tipo de avión?
* **Análisis de Yield Management:** ¿Cómo varía la tarifa promedio pagada según los días de anticipación con los que el pasajero realiza la reserva?
* **Ingreso Promedio por Pasajero:** ¿Cuáles son las rutas más rentables por cabina (Primera, Business, Económica)?
* **Perfilamiento del Pasajero:** ¿Existe alguna relación entre el perfil sociodemográfico, la preferencia de servicio y la clase de tiquete comprada?

## 👥 7. Integrantes del Equipo
* **Jayzir Slaider Martínez Chamorro** — *Líder Técnico, Arquitectura de Datos y Modelado SQL*
* **Valentina Ríos Gómez** — *Ingeniera de Datos y Automatización (Script Python / ETL)*
* **Carlos Andrés Mendoza** — *Analista de Datos y Modelado en Power BI (KPIs & DAX)*
* **Daniela Torres Morales** — *Diseñadora de UI/UX Dashboard y Especialista en Storytelling de Negocio*

## 📝 8. Licencia y Créditos
Proyecto desarrollado como parte de las actividades evaluativas del Bootcamp de Análisis de Datos — MAKAIA.