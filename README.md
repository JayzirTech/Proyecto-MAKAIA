# 🎲 Plataforma de Apuestas en Línea: Gestión de Usuarios, Eventos, Apuestas y Transacciones

**Programa:** Bootcamp de Análisis de Datos — "Quiero Ser Digital (QFSD)" Phase II
**Organización:** Corporación MAKAIA
**Proyecto:** Proyecto Integrador
**Equipo:** 4 integrantes

---

## 📌 1. Descripción del Proyecto

El presente proyecto consiste en el diseño, implementación y análisis de una **base de datos integral para una plataforma de apuestas deportivas en línea**.

La solución busca organizar y gestionar de manera estructurada la información relacionada con los usuarios, eventos deportivos, mercados de apuestas, tickets de apuestas, transacciones financieras y evolución de las cuotas.

El sistema está diseñado para soportar el análisis de la operación de una plataforma de apuestas, manteniendo la integridad y consistencia de los datos y permitiendo generar información útil para el análisis del comportamiento de las apuestas y de las transacciones.

El proyecto contempla los siguientes componentes principales:

* **👤 Gestión de usuarios:** Registro de información personal, historial de apuestas, saldo de cuenta, métodos de pago y estado de verificación de identidad (KYC).

* **🏟️ Eventos deportivos:** Registro de partidos y eventos deportivos, incluyendo participantes o equipos, fecha, hora, liga o torneo y resultado final.

* **🎯 Mercados de apuestas:** Gestión de los diferentes tipos de apuestas disponibles para cada evento, como ganador del partido o número de goles/puntos.

* **🎟️ Apuestas (Tickets):** Registro de cada apuesta realizada por un usuario, incluyendo el evento, mercado, cuota vigente al momento de realizar la apuesta, monto y estado de la apuesta.

* **💰 Transacciones financieras:** Registro de depósitos, retiros y ajustes de saldo, junto con información de fecha, hora, monto, método e identificador de la transacción.

* **📈 Seguimiento de cuotas:** Registro de la evolución de las cuotas de cada mercado a lo largo del tiempo, permitiendo analizar sus variaciones y utilizarlas como insumo para el análisis financiero y de riesgo.

El sistema debe considerar además la necesidad de manejar grandes volúmenes de transacciones, mantener la exactitud de los pagos y contemplar aspectos relacionados con la integridad de la información y el juego responsable.

---

## 🎯 2. Objetivos del Proyecto

### Objetivo General

Desarrollar una solución de análisis de datos para una plataforma de apuestas deportivas que permita modelar, implementar, gestionar y analizar la información relacionada con usuarios, eventos deportivos, apuestas, cuotas y transacciones financieras.

### Objetivos Específicos

1. **Diseñar el modelo de datos:** Construir un Diagrama Entidad-Relación y un modelo relacional coherente con la problemática de las apuestas deportivas.

2. **Implementar la base de datos:** Crear las tablas, relaciones, claves primarias, claves foráneas y restricciones necesarias para garantizar la integridad de los datos.

3. **Generar e incorporar datos:** Crear o preparar un conjunto de datos consistente y representativo que permita simular la operación de la plataforma.

4. **Registrar las apuestas:** Mantener el historial de apuestas realizadas, incluyendo cuotas, montos y estados.

5. **Gestionar las transacciones:** Registrar depósitos, retiros y ajustes de saldo asociados a los usuarios.

6. **Gestionar la evolución de las cuotas:** Registrar los cambios de las cuotas para cada mercado a través del tiempo.

7. **Realizar análisis de datos:** Utilizar los datos almacenados para identificar patrones, comportamientos y resultados relevantes para el negocio.

8. **Construir un dashboard interactivo:** Presentar los principales hallazgos mediante visualizaciones que faciliten la interpretación de la información.

---

## 🏗️ 3. Arquitectura y Modelo de Datos

El modelo de datos se estructura alrededor de los principales componentes funcionales identificados en el problema:

### 👤 Usuarios

Contiene la información relacionada con las personas que utilizan la plataforma.

Entre los datos gestionados se encuentran:

* Información personal.
* Saldo de la cuenta.
* Historial de apuestas.
* Métodos de pago.
* Estado de verificación de identidad (KYC).

### 🏟️ Eventos Deportivos

Representa los partidos o eventos sobre los cuales se pueden realizar apuestas.

Puede contener información como:

* Tipo de deporte.
* Equipos o participantes.
* Fecha y hora.
* Liga o torneo.
* Resultado final.

### 🎯 Mercados de Apuestas

Un evento deportivo puede tener múltiples mercados de apuestas.

Algunos ejemplos planteados en el enunciado son:

* Ganador del partido.
* Número de goles.
* Número de puntos.

### 🎟️ Apuestas / Tickets

Representa las apuestas realizadas por los usuarios.

Cada apuesta debe relacionarse con:

* Usuario.
* Evento deportivo.
* Mercado.
* Cuota utilizada al momento de apostar.
* Monto apostado.
* Estado de la apuesta.

Los estados contemplados en el enunciado son:

* Pendiente.
* Ganada.
* Perdida.
* Anulada.

### 💰 Transacciones

Permite registrar los movimientos financieros de las cuentas de los usuarios:

* Depósitos.
* Retiros.
* Ajustes de saldo.

Cada transacción debe conservar información como:

* Fecha.
* Hora.
* Monto.
* Método.
* Identificador único.

### 📈 Historial de Cuotas

Registra la evolución de las cuotas asociadas a los diferentes mercados.

El seguimiento histórico permite conservar los cambios realizados sobre las cuotas a través del tiempo y utilizar esta información para análisis de ganancias y riesgo.

### Diagrama Entidad-Relación (ER)

> *[Insertar aquí la imagen o enlace al Diagrama ER del proyecto]*

---

## 📂 4. Estructura del Repositorio

```text
├── docs/
│   ├── Diagrama_ER.png
│   └── Informe_de_Analisis.pdf
│
├── sql/
│   ├── 01_ddl_create_tables.sql
│   └── 02_queries_kpis.sql
│
├── src/
│   └── generate_data.py
│
├── dashboard/
│   └── Dashboard_Apuestas.pbix
│
├── .gitignore
│
└── README.md
```

### Descripción de los principales directorios

| Directorio   | Descripción                                                                |
| ------------ | -------------------------------------------------------------------------- |
| `docs/`      | Documentación, diagrama ER e informe de análisis.                          |
| `sql/`       | Scripts de creación de tablas y consultas de análisis.                     |
| `src/`       | Scripts utilizados para generación, preparación o transformación de datos. |
| `dashboard/` | Archivo correspondiente al dashboard desarrollado en Power BI.             |

> La estructura puede modificarse durante el desarrollo para reflejar la organización final del proyecto.

---

## 🛠️ 5. Tecnologías Utilizadas

El proyecto utiliza como base las herramientas proporcionadas por el bootcamp:

* **SQL:** Diseño e implementación de la base de datos.
* **Python:** Generación, preparación y procesamiento de datos.
* **Pandas:** Manipulación y transformación de datos.
* **Power BI:** Construcción del dashboard y visualización de resultados.
* **Git:** Control de versiones.
* **GitHub:** Gestión y colaboración sobre el repositorio.

El bootcamp establece SQL, Python/Pandas y Power BI como parte del stack base, permitiendo además utilizar herramientas adicionales cuando sean necesarias.

---

## 📊 6. Análisis de Datos y Dashboard

El tercer entregable del proyecto contempla la construcción de un **dashboard interactivo** y la presentación de un análisis basado en los datos.

El análisis estará orientado a obtener información relevante sobre la operación de la plataforma de apuestas.

### Áreas de análisis

#### 🎟️ Comportamiento de las Apuestas

Análisis de las apuestas realizadas por los usuarios, considerando variables como:

* Cantidad de apuestas.
* Monto apostado.
* Estado de las apuestas.
* Eventos y mercados seleccionados.
* Cuotas utilizadas.

#### 💰 Análisis de Transacciones

Análisis de los movimientos financieros registrados en la plataforma:

* Depósitos.
* Retiros.
* Ajustes de saldo.
* Montos transaccionados.
* Métodos de pago.
* Comportamiento temporal de las transacciones.

#### 📈 Análisis de Cuotas

Análisis de la evolución de las cuotas asociadas a los diferentes mercados y eventos deportivos.

El historial de cuotas constituye un componente importante para estudiar las variaciones de las cuotas y su relación con el comportamiento de las apuestas.

#### 👤 Análisis de Usuarios

Análisis del comportamiento de los usuarios dentro de la plataforma, considerando información disponible como:

* Historial de apuestas.
* Saldo.
* Métodos de pago.
* Estado KYC.
* Actividad de transacciones.

---

## 📑 7. Informe de Análisis

El informe complementario al dashboard deberá presentar los resultados obtenidos a partir del análisis de los datos.

De acuerdo con los requerimientos del Proyecto Integrador, el informe debe incluir:

1. **Contexto del análisis**
2. **Principales hallazgos**
3. **Interpretación de los resultados**
4. **Conclusiones**
5. **Recomendaciones**

El análisis debe enfocarse en la interpretación de los datos y en la generación de información útil para la toma de decisiones, no únicamente en la cantidad de consultas realizadas.

---

## 🔄 8. Flujo General del Proyecto

```text
                 ┌─────────────────────┐
                 │ Problemática de     │
                 │ apuestas deportivas │
                 └──────────┬──────────┘
                            │
                            ▼
                 ┌─────────────────────┐
                 │ Modelado de datos   │
                 │       ER + SQL      │
                 └──────────┬──────────┘
                            │
                            ▼
                 ┌─────────────────────┐
                 │ Implementación de   │
                 │   Base de Datos     │
                 └──────────┬──────────┘
                            │
                            ▼
                 ┌─────────────────────┐
                 │ Generación / carga  │
                 │      de datos       │
                 └──────────┬──────────┘
                            │
                            ▼
                 ┌─────────────────────┐
                 │     Análisis SQL    │
                 │    y preparación    │
                 └──────────┬──────────┘
                            │
                            ▼
                 ┌─────────────────────┐
                 │      Power BI       │
                 │ Dashboard interactivo│
                 └──────────┬──────────┘
                            │
                            ▼
                 ┌─────────────────────┐
                 │ Hallazgos,          │
                 │ conclusiones y      │
                 │ recomendaciones     │
                 └─────────────────────┘
```

---

## 👥 9. Integrantes del Equipo

El proyecto es desarrollado por un equipo de **4 integrantes**, dentro del rango establecido para el Proyecto Integrador.

* **Jayzir Slaider Martínez Chamorro** — *[Rol por definir]*

* **[Integrante 2]** — *[Rol por definir]*

* **[Integrante 3]** — *[Rol por definir]*

* **[Integrante 4]** — *[Rol por definir]*

La distribución de responsabilidades será definida por el equipo de acuerdo con las diferentes etapas del proyecto. La dinámica oficial establece que cada equipo debe organizar y distribuir sus tareas y que todos los integrantes deben participar en el desarrollo.

---

## 📋 10. Entregables

El proyecto se desarrolla en tres entregables principales:

### Entregable 1 — Modelado de Datos

* Diagrama Entidad-Relación (ER).
* Modelo relacional.
* Identificación de entidades.
* Definición de relaciones.

### Entregable 2 — Implementación de la Base de Datos

* Script DDL para creación de tablas.
* Script DML y/o generación de datos mediante Python.
* Claves primarias.
* Claves foráneas.
* Restricciones de integridad.
* Datos consistentes y representativos.

### Entregable 3 — Dashboard y Análisis

* Dashboard interactivo.
* Visualizaciones.
* Informe de análisis.
* Hallazgos.
* Interpretación de resultados.
* Conclusiones.
* Recomendaciones.

## Estos componentes corresponden a la estructura oficial definida para el Proyecto Integrador.

## 📝 11. Licencia y Créditos

Proyecto desarrollado como parte de las actividades evaluativas del:

**Bootcamp de Análisis de Datos — "Quiero Ser Digital (QFSD)" Phase II**

**Corporación MAKAIA**

**Proyecto Integrador — Plataforma de Apuestas en Línea**

---
