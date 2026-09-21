# Memoria Técnica de Arquitectura de Base de Datos
**Proyecto:** Plataforma de Apuestas Deportivas en Línea  
**Documento:** Entregable 1.3 - Decisiones de Diseño y Normalización  

---

## 1. Visión General del Sistema
El sistema está diseñado para soportar la operación transaccional y analítica de una plataforma de apuestas deportivas en tiempo real[cite: 1]. La arquitectura de la base de datos se estructuró bajo los principios de la **Tercera Forma Normal (3FN)** y adopta una nomenclatura dimensional (`dim_` para tablas maestras/catálogos y `fact_` para eventos/transacciones) para facilitar la integración con motores de Business Intelligence (BI).

---

## 2. Decisiones Clave de Diseño por Módulo

### A. Gestión de Usuarios y Verificación KYC (`dim_users`, `dim_payment_methods`)
* **Cumplimiento Regulatorio y KYC:** La tabla `dim_users` incluye un control de estado KYC (`Pending`, `Verified`, `Rejected`) para restringir retiros o apuestas de alto valor hasta cumplir con las políticas de juego responsable y prevención de lavado de dinero[cite: 1].
* **Propiedad de Métodos de Pago:** `dim_payment_methods` incluye la clave foránea `id_user` para garantizar que cada método de pago (tarjeta, billetera virtual, transferencia) esté vinculado exclusivamente al titular de la cuenta registrada[cite: 1], evitando el uso de instrumentos financieros de terceros.

### B. Estructura Deportiva y Eventos (`dim_sports`, `dim_leagues`, `dim_teams`, `dim_sports_events`)
* **Jerarquía Operativa:** Se normalizó la relación geográfica y deportiva en una cadena de $1:N$ (`dim_sports` $\rightarrow$ `dim_leagues` $\rightarrow$ `dim_sports_events`).
* **Integridad de Enfrentamientos:** La tabla `dim_sports_events` contiene claves foráneas hacia `dim_teams` tanto para el equipo local (`id_home_team`) como para el visitante (`id_away_team`), acompañadas de una restricción `CHECK` que impide que un equipo juegue contra sí mismo.

### C. Seguimiento Dinámico de Cuotas (`dim_bet_markets`, `fact_odds_history`)
* **Trazabilidad Temporal (Audit Trail):** Las cuotas deportivas varían constantemente antes y durante un evento en vivo[cite: 1]. `fact_odds_history` actúa como un registro histórico inmutable donde cada cambio de cuota genera un nuevo registro etiquetado con su estampa de tiempo (`changed_at`)[cite: 1].
* **Garantía del Valor Comprado:** Cuando un usuario realiza una apuesta, el boleto apunta al ID específico de la cuota vigente en `fact_odds_history` y desnormaliza el valor en `odd_value_at_bet`. Esto congela el valor exacto contratado por el apostador, protegiendo la transacción frente a fluctuaciones futuras de la línea de apuestas.

### D. Procesamiento de Apuestas (`fact_bet_tickets`, `fact_bet_selections`)
* **Soporte para Apuestas Simples y Combinadas (Parlays):** Se implementó un patrón Cabecera-Detalle ($1:N$). `fact_bet_tickets` consolida el monto total arriesgado (`total_stake`), el retorno potencial y el estado global del boleto, mientras que `fact_bet_selections` guarda cada una de las selecciones individuales dentro del boleto.

### E. Módulo Financiero y Auditoría (`fact_financial_transactions`)
* **Aislamiento del Balance:** Todas las entradas y salidas de dinero (depósitos, retiros, acreditaciones de premios) se registran de forma auditable en `fact_financial_transactions` con una referencia única `transaction_reference` (UUID)[cite: 1], asegurando trazabilidad contable completa.

---

## 3. Matriz de Normalización (3FN)

1. **Primera Forma Normal (1FN):** Todos los campos contienen valores atómicos (sin listas de selecciones o resultados concatenados en una sola celda).
2. **Segunda Forma Normal (2FN):** Todas las tablas poseen una Clave Primaria simple o compuesta, y cada atributo no clave depende de la totalidad de dicha clave.
3. **Tercera Forma Normal (3FN):** Se eliminaron las dependencias transitivas; los datos de usuarios, deportes, ligas, equipos y pagos existen únicamente en sus respectivas tablas de dimensión.