# Memoria Técnica de Arquitectura de Base de Datos
**Proyecto:** Plataforma de Apuestas Deportivas en Línea  
**Documento:** Entregable 1.3 - Decisiones de Diseño y Normalización  

---

## 1. Visión General del Sistema
El sistema está diseñado para soportar la operación transaccional y analítica de una plataforma de apuestas deportivas en tiempo real. La arquitectura de la base de datos se estructuró bajo los principios de la **Tercera Forma Normal (3FN)** y adopta una nomenclatura dimensional (`dim_` para tablas maestras/catálogos, `rel_` para relaciones intermedias y `fact_` para eventos/transacciones) para facilitar el procesamiento analítico e integración con motores de Business Intelligence (BI).

---

## 2. Decisiones Clave de Diseño por Módulo

### A. Gestión de Usuarios y Pasarela de Pagos (`dim_users`, `dim_payment_methods`)
* **Cumplimiento Regulatorio y KYC:** La tabla `dim_users` incluye un control de estado KYC (`Pending`, `Verified`, `Rejected`) para restringir retiros o apuestas de alto valor hasta cumplir con las políticas de juego responsable y prevención de lavado de dinero.
* **Delegación de Datos Financieros Sensibles (Catálogo Estático):** Para garantizar la seguridad del usuario y evitar almacenar información sensible de tarjetas o cuentas bancarias en la base de datos propia, la tabla `dim_payment_methods` actúa como un **catálogo estático** de los medios de pago disponibles en la plataforma (ej. PSE, Tarjeta de Crédito, Nequi). La captura y tokenización de instrumentos financieros se delega a pasarelas externas (ej. PayU, Stripe), manteniendo una arquitectura ligera, segura y enfocada en el flujo operativo.

### B. Estructura Deportiva y Eventos (`dim_sports`, `dim_leagues`, `dim_teams`, `rel_team_leagues`, `dim_sports_events`)
* **Jerarquía Operativa:** Se normalizó la relación geográfica y deportiva en una cadena de $1:N$ (`dim_sports` $\rightarrow$ `dim_leagues` $\rightarrow$ `dim_sports_events`).
* **Relación Multi-Liga de Equipos (`rel_team_leagues`):** Mediante la tabla intermedia/pivote `rel_team_leagues`, se rompe la relación de Muchos a Muchos ($N:M$) entre equipos y ligas. Esto otorga flexibilidad al sistema para que un mismo equipo (ej. *Real Madrid*) pueda estar inscrito simultáneamente en múltiples competiciones (*LaLiga*, *UEFA Champions League*).
* **Integridad de Enfrentamientos:** La tabla `dim_sports_events` asigna claves foráneas hacia `dim_teams` tanto para el equipo local (`id_home_team`) como para el visitante (`id_away_team`), garantizando la correcta definición de los partidos programados o en vivo.

### C. Seguimiento Dinámico de Cuotas (`dim_bet_markets`, `fact_odds_history`)
* **Trazabilidad Temporal (Audit Trail):** Las cuotas deportivas varían constantemente antes y durante un evento en vivo. `fact_odds_history` actúa como un registro histórico inmutable donde cada cambio de cuota genera un nuevo registro etiquetado con su estampa de tiempo (`changed_at`).
* **Garantía del Valor Comprado (`odd_value_at_bet`):** Al momento en que un usuario confirma su apuesta, la tabla `fact_bet_selections` vincula el registro con `fact_odds_history` y **congela el valor exacto de la cuota comprada** en la columna `odd_value_at_bet`. Esto blinda la transacción contra las fluctuaciones posteriores del mercado, asegurando la liquidez y el cálculo justo del boleto.

### D. Procesamiento de Apuestas y Cálculo de Ganancias (`fact_fact_bet_tickets`, `fact_bet_selections`)
* **Soporte para Apuestas Simples y Combinadas (Parlays):** Se implementó un patrón Cabecera-Detalle ($1:N$). `fact_bet_tickets` consolida el monto total arriesgado (`total_stake`), el retorno potencial (`potential_payout`) y el estado global del boleto (*Pending, Won, Lost, Cancelled*), mientras que `fact_bet_selections` guarda cada una de las selecciones individuales.
* **Auditoría de Ganancias Netas y Brutas:** Esta estructura permite calcular cuantitativamente el rendimiento financiero de cada jugador:
  * **Ganancia Neta por Juego:** Obtenida al restar la inversión total arriesgada ($\sum \text{total\_stake}$) del retorno acumulado de los boletos ganadores ($\sum \text{potential\_payout}_{\text{Won}}$).
  * **Ganancia monetaria acreditada:** Contrastada contra las acreditaciones efectivas registradas en el módulo financiero.

### E. Módulo Financiero y Auditoría (`fact_financial_transactions`)
* **Aislamiento y Trazabilidad de Fondos:** Todas las entradas y salidas de dinero (depósitos, retiros, acreditaciones de premios/`Payout`) se registran de forma auditable en `fact_financial_transactions` con una referencia única `transaction_reference` (UUID). Esta tabla vincula directamente al usuario (`id_user`) con la opción elegida del catálogo de pagos (`id_payment_method`), asegurando una auditoría contable completa.

---

## 3. Matriz de Normalización (3FN)

1. **Primera Forma Normal (1FN):** Todos los campos contienen valores atómicos (sin listas de selecciones, arreglos o resultados concatenados en una sola celda).
2. **Segunda Forma Normal (2FN):** Todas las tablas poseen una Clave Primaria simple o compuesta (como la clave compuesta `(id_team, id_league)` en `rel_team_leagues`), y cada atributo no clave depende de la totalidad de dicha clave.
3. **Tercera Forma Normal (3FN):** Se eliminaron las dependencias transitivas; los datos de usuarios, deportes, ligas, equipos, opciones de pago y cuotas existen únicamente en sus respectivas tablas de dimensión/catálogo.