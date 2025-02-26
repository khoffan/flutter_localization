import argparse
import json
from deep_translator import GoogleTranslator

parser = argparse.ArgumentParser(description="Translate JSON file to another language")

parser.add_argument("--output_file", type=str, help="Output JSON file")

parse = parser.parse_args()

input_file = r"en.json"
output_file = r"{}.json".format(parse.output_file)

def translate_text(text, target_lang="th"):
    placeholder = [];
    
    while "{}" in text:
        placeholder.append("{}")
        text = text.replace("{}", "123", 1)
    
    translate_text = GoogleTranslator(source='en', target=target_lang).translate(text)
    
    for place in placeholder:
        translate_text = translate_text.replace("123", place, 1)
    
    
    return translate_text

def translate_json(data, target_lang="th"):
    if isinstance(data, dict):
        return {key: translate_json(value, target_lang) for key, value in data.items()}
    elif isinstance(data, list):
        return [translate_json(value, target_lang) for value in data]
    elif isinstance(data, str):
        return translate_text(data, target_lang)
    return data

with open(input_file, "r", encoding="utf-8") as file:
    data = json.load(file)

translate_lang = "{}".format(parse.output_file)
translate_data = translate_json(data, translate_lang)

print(translate_data)


with open(output_file, "w", encoding="utf-8") as file:
    json.dump(translate_data, file, ensure_ascii=False, indent=4)

print("Translation completed!")