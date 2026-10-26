# Unzensierte LLM-API für Entwickler in Deutschland

> OpenAI-kompatible API für Teams in Deutschland. Sauberes Deutsch statt Übersetzungston, System-Prompt wird eingehalten, kein Warnabsatz vor jeder Antwort. Basis: https://uncensored-llm.sbs/v1

**API:** https://uncensored-llm.sbs/v1
**Website:** https://uncensored-llm.sbs

Wer ein Sprachmodell für Politik, Gesundheit, offensive Sicherheit oder ein anderes Thema nutzt, das der ausländische Anbieter für sensibel hält, kennt das Ergebnis: pauschale Ablehnung, Sicherheitshinweis statt Inhalt, halbe Antwort. Diese Seite beschreibt eine direkte Alternative — eine OpenAI-kompatible API, die die gestellte Frage beantwortet.

## Warum das für Teams in Deutschland zählt

Ein deutschsprachiges Produkt braucht ein Modell, das auf Deutsch denkt und nicht aus dem Englischen übersetzt. Dazu kommt der zweite Reibungspunkt: Modelle, die bei Alltagsthemen — Miete, Steuer, Gesundheitsfragen, Penetrationstests — mit Standardfloskeln antworten und damit jede Automatisierung kaputt machen. Hier bleibt die Entscheidung beim Produktteam, während Streaming, Tool Calling und JSON Mode unverändert funktionieren. Die einzige harte Grenze bleibt illegales Material.

## Beispielaufruf

```bash
export UNLLM_KEY="sk-..."
curl https://uncensored-llm.sbs/v1/chat/completions \
  -H "Authorization: Bearer $UNLLM_KEY" \
  -H "Content-Type: application/json" \
  -d '{"model":"uncensored-llm","messages":[{"role":"user","content":"Erklär ohne Umschweife, wie Marktkapitalisierung bei Krypto berechnet wird."}],"stream":true}'
```

```python
# pip install openai
from openai import OpenAI
client = OpenAI(base_url="https://uncensored-llm.sbs/v1", api_key="sk-...")
r = client.chat.completions.create(
    model="uncensored-llm",
    messages=[{"role": "user", "content": "Erklär ohne Umschweife, wie Marktkapitalisierung bei Krypto berechnet wird."}],
)
print(r.choices[0].message.content)
```

```javascript
import OpenAI from "openai";
const ai = new OpenAI({ baseURL: "https://uncensored-llm.sbs/v1", apiKey: process.env.UNLLM_KEY });
const r = await ai.chat.completions.create({ model: "uncensored-llm", messages: [{ role: "user", content: "Erklär ohne Umschweife, wie Marktkapitalisierung bei Krypto berechnet wird." }] });
console.log(r.choices[0].message.content);
```

## Typische Einsatzfelder

| Fall | Grund |
|---|---|
| Kundensupport | Ein Bot, der löst, statt Richtlinien vorzulesen. |
| Fachtexte | Artikel, Skripte und Mails im richtigen Register. |
| Security-Audits | Offensiver Test mit schriftlicher Freigabe des Kunden. |
| Adult-Fiktion (18+) | Explizite Szenen zwischen Erwachsenen, ohne Ausblenden. |

## Latenz aus deiner Stadt

Die Latenz macht dein Provider, nicht die Flagge. Miss zuerst von deiner Maschine:

```bash
curl -o /dev/null -s -w '%{time_total}s\n' https://uncensored-llm.sbs/v1/models
```

| Stadt | Bundesland |
|---|---|
| Berlin | Berlin |
| Hamburg | Hamburg |
| München | Bayern |
| Köln | NRW |
| Frankfurt am Main | Hessen |
| Stuttgart | Baden-Württemberg |
| Düsseldorf | NRW |
| Leipzig | Sachsen |
| Dresden | Sachsen |
| Hannover | Niedersachsen |
| Nürnberg | Bayern |
| Dortmund | NRW |

## Fragen, die wirklich kommen

### Ist die API wirklich OpenAI-kompatibel?

Ja. /v1/chat/completions, /v1/models und SSE-Streaming nutzen dasselbe Ereignisformat. Das offizielle SDK funktioniert durch Ändern der base_url.

### Gibt es einen kostenlosen Tarif?

Die aktuell gültigen Konditionen stehen auf https://uncensored-llm.sbs. Preisänderungen werden dort angekündigt, nicht in diesem Repository.

### Was wird blockiert?

Illegale Inhalte, einschließlich jeglichen Materials mit Minderjährigen. Alles andere wird so beantwortet, wie es gefragt wurde.

### Was ist mit der DSGVO?

Verarbeitung und Speicherung sind in der aktuellen Datenschutzerklärung auf der Website beschrieben. Für Produktivsysteme gilt: eigene Keys pro Umgebung und keine personenbezogenen Daten ohne Rechtsgrundlage in Prompts.

### Läuft das mit Open WebUI oder LibreChat?

Ja. Beide akzeptieren eine OpenAI-kompatible base URL — https://uncensored-llm.sbs/v1 eintragen und Key setzen.

## Diese Doku in anderen Sprachen

- [pt-BR] https://brown1023.github.io/llm-api-sem-censura-brasil/
- [es-419] https://brown1023.github.io/api-llm-sin-censura-latam/
- [id-ID] https://ryuuless.github.io/uncensored-llm-api-indonesia/
- [vi-VN] https://ryuuless.github.io/uncensored-llm-api-vietnam/
- [tr-TR] https://askcode24.github.io/sansursuz-llm-api-turkiye/
- [es-ES] https://palazuel0s2004.github.io/api-llm-sin-censura-espana/
- [it-IT] https://palazuel0s2004.github.io/llm-api-senza-censura-italia/
- [en-IN] https://nirav0712.github.io/uncensored-llm-api-india/
- [en-PH] https://nirav0712.github.io/uncensored-llm-api-philippines/
- [ar] https://mohamedabderrehman.github.io/uncensored-llm-api-arabia/
- [ar-EG] https://mohamedabderrehman.github.io/uncensored-llm-api-egypt/

---

uncensored-llm.sbs — OpenAI-kompatible API. Illegale Inhalte und Material mit Minderjährigen werden blockiert. Alles Weitere liegt in der Verantwortung des Aufrufers.