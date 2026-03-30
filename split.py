import os

dir_path = r'c:\Users\ADMIN\OneDrive\Desktop\Projects\public_speaker\public_speaker'
index_path = os.path.join(dir_path, 'index.html')
style_path = os.path.join(dir_path, 'style.css')

with open(index_path, 'r', encoding='utf-8') as f:
    lines = f.readlines()

css_lines = lines[14:2783]
new_index_lines = lines[:14] + ['  <link rel="stylesheet" href="style.css" />\n'] + lines[2783:]

with open(style_path, 'w', encoding='utf-8') as f:
    f.writelines(css_lines)

with open(index_path, 'w', encoding='utf-8') as f:
    f.writelines(new_index_lines)

print("Split completed successfully!")
