#!/usr/bin/env python3
"""Generate an image via the Gemini API and save it to disk.

Usage:
    python3 scripts/gen_image.py <output_path> [ref_image ...] <<<'prompt text'

Env:
    MODEL   image model (default: gemini-3-pro-image-preview, i.e. Nano Banana Pro)
    ASPECT  aspect ratio (default: 16:9)
Reads GEMINI_API_KEY from .env.local. Reference images are passed inline so the
model can match the real artwork (e.g. the Nix logo).
"""
import sys, os, json, base64, urllib.request, urllib.error, pathlib, mimetypes

ROOT = pathlib.Path(__file__).resolve().parent.parent
MODELS_FALLBACK = ["gemini-3-pro-image-preview", "gemini-2.5-flash-image"]


def load_key():
    for line in (ROOT / ".env.local").read_text().splitlines():
        if line.startswith("GEMINI_API_KEY="):
            return line.split("=", 1)[1].strip()
    raise SystemExit("GEMINI_API_KEY not found in .env.local")


def ref_part(path):
    mime = mimetypes.guess_type(path)[0] or "image/png"
    data = base64.b64encode(pathlib.Path(path).read_bytes()).decode()
    return {"inlineData": {"mimeType": mime, "data": data}}


def call(model, parts, aspect, key):
    url = f"https://generativelanguage.googleapis.com/v1beta/models/{model}:generateContent?key={key}"
    body = json.dumps({
        "contents": [{"parts": parts}],
        "generationConfig": {
            "responseModalities": ["IMAGE"],
            "imageConfig": {"aspectRatio": aspect},
        },
    }).encode()
    req = urllib.request.Request(url, data=body, headers={"Content-Type": "application/json"})
    resp = urllib.request.urlopen(req, timeout=240)
    return json.loads(resp.read())


def main():
    out_path = sys.argv[1]
    refs = sys.argv[2:]
    prompt = sys.stdin.read().strip()
    key = load_key()
    aspect = os.environ.get("ASPECT", "16:9")

    models = [os.environ["MODEL"]] if os.environ.get("MODEL") else MODELS_FALLBACK
    parts = [ref_part(r) for r in refs] + [{"text": prompt}]

    last_err = None
    for model in models:
        try:
            data = call(model, parts, aspect, key)
        except urllib.error.HTTPError as e:
            last_err = f"HTTP {e.code} on {model}: {e.read().decode()[:600]}"
            print(last_err)
            continue
        cand = data.get("candidates", [{}])[0]
        for p in cand.get("content", {}).get("parts", []):
            if "inlineData" in p:
                raw = base64.b64decode(p["inlineData"]["data"])
                pathlib.Path(out_path).write_bytes(raw)
                print(f"saved {out_path} {len(raw)} bytes via {model} ({aspect})")
                return
            if "text" in p:
                print("model text:", p["text"][:300])
        last_err = f"no image from {model}: {json.dumps(data)[:600]}"
        print(last_err)
    raise SystemExit(f"failed: {last_err}")


if __name__ == "__main__":
    main()
