# agua-barrio
Base de datos para estudio de consumo de agua en un barrio

---

### 📌 `docs/diagrama_ER.md`
```markdown
# Diagrama ER (Mermaid)

```mermaid
erDiagram
  BARRIO ||--o{ HOGAR : "tiene"
  HOGAR ||--o{ MEDIDOR : "posee"
  MEDIDOR ||--o{ LECTURA_MENSUAL : "registra"
  HOGAR ||--o{ FACTURA : "recibe"
  HOGAR ||--o{ ENCUESTA : "responde"
  ENCUESTA ||--o{ RESPUESTA_ENCUESTA : "incluye"
  HOGAR ||--o{ CONSUMO_ACTIVIDAD_MENSUAL : "realiza"
  ACTIVIDAD_CONSUMO ||--o{ CONSUMO_ACTIVIDAD_MENSUAL : "clasifica"
  REFERENCIA_CONSUMO }o--o{ VW_ALERTAS_CONSUMO_ALTO : "usada en vista"

  BARRIO {
    int id_barrio PK
    string nombre
    string ciudad
    string departamento
  }
  HOGAR {
    int id_hogar PK
    int id_barrio FK
    string codigo_externo
    string direccion
    tinyint estrato
    tinyint num_personas
    bool tiene_jardin
    bool reutiliza_agua
    text observaciones
  }
  MEDIDOR {
    int id_medidor PK
    int id_hogar FK
    string numero
    date fecha_instalacion
    bool activo
  }
  LECTURA_MENSUAL {
    bigint id_lectura PK
    int id_medidor FK
    smallint anio
    tinyint mes
    decimal m3_consumidos
    enum origen
    date fecha_registro
    string observaciones
  }
  FACTURA {
    bigint id_factura PK
    int id_hogar FK
    smallint anio
    tinyint mes
    string numero_factura
    decimal m3_facturados
    decimal valor_total
    date fecha_emision
    string enlace_soporte
  }
  ACTIVIDAD_CONSUMO {
    int id_actividad PK
    string nombre
    string descripcion
  }
  CONSUMO_ACTIVIDAD_MENSUAL {
    bigint id_consumo_act PK
    int id_hogar FK
    int id_actividad FK
    smallint anio
    tinyint mes
    decimal m3_estimados
    enum fuente
  }
  ENCUESTA {
    bigint id_encuesta PK
    int id_hogar FK
    date fecha
    string encuestador
    text observaciones
  }
  RESPUESTA_ENCUESTA {
    bigint id_respuesta PK
    bigint id_encuesta FK
    string pregunta
    string respuesta
  }
  REFERENCIA_CONSUMO {
    int id_referencia PK
    string descripcion
    decimal m3_mes_recomendado
    string fuente
    date vigente_desde
    date vigente_hasta
  }
