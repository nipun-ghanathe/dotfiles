import re
import sys
from pathlib import Path

dracula_nord = {
    "282a36": "2e3440",
    "44475a": "434c5e",
    "f8f8f2": "eceff4",
    "6272a4": "5e81ac",
    "8be9fd": "88c0d0",
    "ffb86c": "d08770",
    "bd93f9": "5e81ac",
    "ff5555": "bf616a",
    "f1fa8c": "ebcb8b",
    "50fa7b": "a3be8c",
    "ff79c6": "b48ead",
}

print("---------------------------------------------------------------------------")
print("""Welcome to Dracula to Nord Converter.

This program reads text from file provided and replaces the Dracula colors
in it with Nord colors (hex values)""")
print("---------------------------------------------------------------------------\n")

file_path = Path(input("Enter path of the file: ")).expanduser().resolve()
if not file_path.exists():
    print("The file doesn't exist.")
    sys.exit()

data = file_path.read_text(encoding="utf-8", newline="\n")

backup_path = Path(file_path.name + ".bak")
backup_path.write_text(data)
print(f"Backup created at {backup_path}")

for key, value in dracula_nord.items():
    data = re.sub(key, value, data, flags=re.IGNORECASE)
file_path.write_text(data, encoding="utf-8", newline="\n")
print(f"All dracula colors in {file_path} have been replaced with nord colors.")
