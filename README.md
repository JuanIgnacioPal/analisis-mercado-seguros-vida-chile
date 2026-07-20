# Analisis del Mercado Chileno de Seguros de Vida
## Proyecto BI basado en estructura CMF
----
## **Fase 1 — Problema de negocio**

**Escenario:** Una compañía multinacional de seguros de vida que opera en Chile desea analizar la evolución del mercado y el desempeño relativo de sus principales competidores. La gerencia necesita una solución analítica que permita monitorear crecimiento, participación de mercado, rentabilidad, siniestralidad, eficiencia operacional, solvencia y composición del negocio para apoyar decisiones estratégicas.

**Problema de negocio:**
La dirección de una compañía multinacional de seguros de vida necesita comprender cómo está evolucionando el mercado chileno, qué compañías están fortaleciendo o perdiendo su posición competitiva y qué factores financieros y operacionales explican las diferencias de desempeño entre aseguradoras.

**Problema analítico**
Analizar información trimestral de compañías de seguros de vida entre 2023 y 2025 para identificar tendencias de crecimiento, cambios en participación de mercado, diferencias de rentabilidad, niveles de siniestralidad, eficiencia de gastos, solvencia y evolución de la cartera asegurada.

Nuestro análisis utilizará principalmente:
- Análisis descriptivo: determinar qué ocurrió en el mercado y en cada compañía durante el período estudiado. 
- Análisis diagnóstico: investigar qué indicadores pueden ayudar a explicar las diferencias observadas entre compañías y períodos.

**Stakeholders**
Principal: 
- Gerencia de Estrategia y Business Intelligence de una aseguradora multinacional de vida en Chile.
Secundarios:
- Gerencia Comercial: interesada en crecimiento de primas, productos, cartera de asegurados y participación de mercado. 
- Gerencia Financiera: interesada en primas, resultados financieros, rentabilidad, patrimonio y resultados de inversiones. 
- Gerencia de Riesgos: interesada en siniestralidad, reservas, capital y solvencia. 
- Alta Dirección: interesada en obtener una visión ejecutiva y consolidada del desempeño competitivo del mercado.

**Objetivo general**

Desarrollar una solución de Business Intelligence que permita analizar y comparar el desempeño competitivo, financiero y operacional de compañías ficticias del mercado chileno de seguros de vida durante el período 2023-2025, identificando tendencias y diferencias relevantes que puedan apoyar la toma de decisiones estratégicas.

**Objetivos específicos**

- Analizar la evolución de la prima directa del mercado y de cada compañía para identificar tendencias de crecimiento o contracción.
- Evaluar la evolución de la participación de mercado para detectar compañías que ganan o pierden posición competitiva. 
- Comparar indicadores de desempeño financiero como resultado técnico, resultado neto y ROE entre compañías y períodos. 
- Analizar la siniestralidad y los gastos administrativos para identificar posibles diferencias de eficiencia entre aseguradoras. 
- Evaluar indicadores simplificados de solvencia y capital para identificar diferencias en la fortaleza financiera de las compañías. 
- Analizar la composición de las primas y la evolución de la cartera para identificar qué productos y segmentos impulsan el desempeño de cada compañía.

**Preguntas de negocio**

1. ¿Cómo ha evolucionado el tamaño del mercado?
 - ¿Cómo ha evolucionado la prima directa total del mercado entre 2023 y 2025 y qué períodos registraron mayor crecimiento?

2. ¿Quiénes lideran el mercado?
 - ¿Qué compañías concentran la mayor participación de mercado y cómo ha cambiado su posición competitiva durante el período analizado?

3. ¿Quiénes están creciendo más rápido?
 - ¿Qué compañías presentan las mayores tasas de crecimiento trimestral e interanual de prima directa?

4. ¿La compañía más grande es también la más rentable?
 - ¿Existe una relación visible entre participación de mercado y rentabilidad?

5. ¿Qué compañías presentan mayor siniestralidad?
 - ¿Qué aseguradoras registran los niveles más altos y bajos de tasa de siniestralidad y cómo evoluciona este indicador?

7. ¿Qué compañías operan con mayor eficiencia?
 - ¿Qué aseguradoras presentan menores ratios de gastos administrativos respecto de sus primas retenidas?

8. ¿Qué compañías tienen mejores resultados técnicos?
 - ¿Qué compañías convierten de manera más eficiente sus primas retenidas en resultados técnicos positivos después de considerar siniestros y gastos administrativos?

9. ¿Qué compañías presentan mayor fortaleza financiera?
 - ¿Cómo se comparan las aseguradoras en términos de patrimonio, capital disponible, capital requerido y ratio de solvencia?

10. ¿Qué productos impulsan las primas?
 - ¿Cuál es la composición de las primas entre Vida y Protección, Salud, Ahorro/APV, Rentas Vitalicias y Accidentes Personales, y cómo cambia entre compañías?

11. ¿Cómo evoluciona la cartera asegurada?
 - ¿Qué compañías muestran mayor crecimiento de asegurados y pólizas, y cómo se relacionan los nuevos asegurados y las cancelaciones con ese crecimiento?

**Hipótesis iniciales**

Antes de analizar los datos estableceremos algunas hipótesis.
H1: Las compañías con mayor participación de mercado no necesariamente presentan los mejores niveles de rentabilidad. 
H2: Un mayor nivel de siniestralidad está asociado con un menor resultado técnico, manteniendo constantes los demás factores. 
H3: Las compañías especializadas en productos previsionales presentan mayores niveles de reservas técnicas que las compañías concentradas principalmente en productos de protección. 
H4: Las compañías que combinan menor siniestralidad y menor ratio de gastos tienden a presentar mejores resultados técnicos. 
H5: Un crecimiento elevado de primas no implica necesariamente una mejora equivalente en rentabilidad. 

**Alcance del proyecto**

- Período 2023-T1 a 2025-T4. 
- 12 compañías aseguradoras ficticias. 
- Mercado ficticio de seguros de vida en Chile. 
- Análisis trimestral. 
- Primas y composición de productos. 
- Siniestralidad. 
- Gastos administrativos. 
- Resultados financieros simplificados. 
- Reservas y solvencia simplificadas. 
- Pólizas y cartera de asegurados.

**Limitaciones del proyecto**

El dataset utilizado en este proyecto es completamente sintético. Los nombres de las compañías y todos los valores financieros, operacionales y comerciales fueron generados exclusivamente con fines educativos y de portafolio.
Aunque las variables y relaciones utilizadas buscan representar conceptos habituales de la industria aseguradora chilena, los resultados obtenidos no describen el desempeño real de MetLife Chile ni de ninguna otra compañía aseguradora.
Algunos indicadores, especialmente aquellos relacionados con resultado técnico y solvencia, utilizan fórmulas simplificadas y no deben interpretarse como cálculos regulatorios, contables o actuariales oficiales.
El proyecto está orientado a demostrar competencias de análisis de datos, SQL y Business Intelligence, y no constituye asesoría financiera, actuarial o de inversiones.

**Resultado esperado**
Al finalizar el proyecto, nuestra solución debería permitir:

- Identificar rápidamente las compañías líderes del mercado. 
- Observar qué aseguradoras están ganando o perdiendo participación de mercado. 
- Detectar tendencias de crecimiento o contracción. 
- Comparar siniestralidad y eficiencia operacional. 
- Comparar rentabilidad y desempeño financiero. 
- Analizar la composición del negocio por producto. 
- Evaluar indicadores simplificados de solvencia. 
- Transformar resultados analíticos en conclusiones respaldadas por datos, diferenciando claramente hechos, interpretaciones y recomendaciones.

