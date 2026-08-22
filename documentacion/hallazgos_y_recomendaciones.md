# 🎯 Fase 7 — Hallazgos y recomendaciones ejecutivas

## Objetivo

Convertir los resultados validados del proyecto en decisiones posibles para el escenario ficticio, manteniendo una separación explícita entre evidencia, interpretación, recomendación y limitación.

> **Alcance:** las compañías, valores y resultados son sintéticos. Las recomendaciones demuestran razonamiento analítico y no constituyen asesoría sobre aseguradoras reales ni sobre el mercado chileno real.

---

## Hallazgos ejecutivos priorizados

### 1. El líder conserva escala, pero su ventaja competitiva se reduce

- VidaGlobal mantiene el primer lugar con **17,32%** de participación en 2025-T4.
- Horizonte alcanza **14,20%** y la brecha entre ambos cae de **4,38 pp a 3,12 pp** en un año.
- Horizonte (**+10,83% YoY**) y NovaProtección (**+7,11%**) crecen por encima del mercado (**+4,29%**), mientras VidaGlobal crece **+1,77%**.
- La concentración Top 5 permanece estable en torno a **61%-63%**, por lo que el cambio principal ocurre dentro del grupo líder.

**Lectura:** la amenaza competitiva relevante no es una concentración creciente, sino la redistribución de share entre aseguradoras de escala significativa.

---

### 2. El crecimiento de primas no equivale a expansión de la base asegurada

Entre 2024-T4 y 2025-T4:

- Prima directa: **+4,29%**.
- Asegurados vigentes: **-3,83%**.
- Pólizas vigentes: **+1,49%**.

**Lectura:** la producción crece sin una expansión equivalente del stock de asegurados. El dataset no permite atribuir una causa específica.

---

### 3. Eficiencia técnica y fortaleza de capital deben leerse por separado

- El margen técnico del mercado mejora de **29,83% a 31,51%** YoY.
- La solvencia sintética disminuye de **193,12% a 180,48%**.
- Cordillera combina **40,97%** de margen con **136,00%** de solvencia sintética, mientras AndesCare presenta **16,16%** de margen y **222,51%** de solvencia sintética.

**Lectura:** un único ranking compuesto ocultaría diferencias relevantes entre desempeño técnico y cobertura de capital.

---

### 4. El mix permanece estable; dos productos explican la mayor parte del crecimiento

Entre 2024-T4 y 2025-T4:

- Vida y Protección aporta **36,80%** del aumento absoluto de primas por producto.
- Rentas Vitalicias aporta **32,91%**.
- En conjunto explican **69,72%** del crecimiento absoluto.
- La participación de cada producto varía menos de aproximadamente **1 pp** durante los 12 trimestres.

**Lectura:** el crecimiento se produce principalmente dentro de una estructura de mix estable, no por una gran rotación hacia nuevas categorías.

---

### 5. La cartera requiere una regla explícita de conciliación antes de explicar movimientos de clientes

Durante 2025:

- Nuevos asegurados: **1.165.912**.
- Cancelaciones: **673.317**.
- Saldo neto calculado: **+492.595**.
- Cambio observado del stock de asegurados: **-363.754**.
- Diferencia no conciliada: **-856.349**.

**Lectura:** `Nuevos Asegurados - Cancelaciones` es útil como flujo descriptivo, pero no explica el cambio del stock con las variables disponibles.

**Control de calidad:** documentar como **DQ-02 — No conciliación stock-flujo de cartera**.

---

## Recomendaciones ejecutivas

| Prioridad | Recomendación | Stakeholder principal | Acción propuesta | Evidencia que la activa |
|---|---|---|---|---|
| **Alta** | Implementar una watchlist competitiva | Estrategia / BI | Seguir participación, cambio de share y YoY por compañía en cada cierre | Horizonte y NovaProtección combinan escala relevante con crecimiento superior al mercado |
| **Alta** | Investigar la divergencia prima–asegurados | Comercial / Producto / BI | Incorporar prima promedio, renovación, persistencia y trazabilidad cliente/póliza | Prima +4,29% vs asegurados -3,83% |
| **Alta** | Separar eficiencia técnica y fortaleza de capital | Finanzas / Riesgos | Mantener margen, siniestralidad y gastos separados de solvencia/capital; evitar score único | Margen mejora mientras solvencia sintética cae |
| **Media-Alta** | Profundizar los motores de crecimiento de los dos productos principales | Producto / Comercial | Analizar Vida y Protección y Rentas Vitalicias por volumen, prima promedio, pólizas y perfil de cliente | Ambos explican 69,72% del aumento absoluto YoY |
| **Alta** | Implantar conciliación stock-flujo como control de datos | BI / Data Governance | Exigir Stock final = Stock inicial + Altas - Bajas ± Otros movimientos identificados | DQ-02: diferencia no conciliada de -856.349 asegurados |

### Regla transversal de interpretación

Para crecimiento de mercado, usar **YoY como referencia estructural** y **QoQ como señal táctica**, porque en el escenario existen caídas fuertes de T1 frente a T4 que coexisten con crecimiento interanual positivo.

---

## Contraste final de hipótesis

| Hipótesis | Resultado final |
|---|---|
| Mayor market share no implica mayor rentabilidad | **Apoyada con matiz:** el margen técnico permite observar que escala y eficiencia no coinciden necesariamente; ROE fue excluido por DQ-01. |
| Mayor siniestralidad se asocia con menor resultado técnico | **No se utiliza como evidencia independiente:** existe dependencia matemática en la construcción del resultado técnico. |
| Perfiles previsionales presentan mayores reservas | **Apoyada descriptivamente:** patrón consistente dentro del dataset, pero con muestra pequeña y sintética. |
| Menor siniestralidad + gastos mejora el resultado técnico | **Verdadera por construcción:** forma parte de la fórmula del resultado técnico. |
| Crecimiento de primas no implica mejora equivalente de rentabilidad | **Apoyada:** crecimiento, margen y solvencia evolucionan de forma distinta entre compañías y períodos. |

---

## Limitaciones que acompañan los hallazgos

- Dataset 100% sintético, 12 compañías y 12 trimestres.
- Resultado técnico y solvencia simplificados; no son cálculos regulatorios, contables ni actuariales oficiales.
- DQ-01: ROE sintético implausiblemente alto; excluido de la narrativa principal.
- DQ-02: flujos de cartera no concilian con el cambio del stock de asegurados.
- No se demuestra causalidad con relaciones visuales o matemáticas.
- `Saldo Neto Cartera` no equivale a churn, retención o renovación.

---

## Conclusión

La Fase 7 demuestra que el proyecto no termina en la construcción del dashboard: los resultados se transforman en una lectura ejecutiva, se priorizan decisiones y también se identifican límites que impiden afirmar más de lo que los datos soportan.
