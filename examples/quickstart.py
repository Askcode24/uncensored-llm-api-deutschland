# Unzensierte LLM-API für Entwickler in Deutschland — quickstart
# pip install openai
import os
from openai import OpenAI

client = OpenAI(base_url="https://uncensored-llm.sbs/v1", api_key=os.environ["UNLLM_KEY"])
r = client.chat.completions.create(
    model="uncensored-llm",
    messages=[{"role": "user", "content": "Erklär ohne Umschweife, wie Marktkapitalisierung bei Krypto berechnet wird."}],
)
print(r.choices[0].message.content)
