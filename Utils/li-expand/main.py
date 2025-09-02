#!/usr/bin/env python3

import lxml.etree as ET
import re
import sys
from pathlib import Path

from config import conf

def main():
    path = Path(sys.argv[1])
    if path.is_file():
        print("Файл")
        processv2(path, path)
    elif path.is_dir():
        print(f"{path} це директорія")
        for file in path.rglob("*.xml"):
            if file.is_file():
                print(f"Processing {file}")
                processv2(file, file)
    else:
        print("Заданий шлях не існує")

def processv2(input: Path, output: Path):
    tree = ET.parse(input, ET.XMLParser(remove_blank_text=True))
    root = tree.getroot()
    expandv2(root)
    tree.write(output, encoding="utf-8", pretty_print=True, xml_declaration=True)
    format(output, output)

def expandv2(root):
    # So basically it searches each id that is in the config in the file
    # it might be better to just dump what classes are available and search in that
    # but I'm too lazy for that shit, if it works, it aint stupid
    for id in conf.keys():
        print(f"Searching for {id}")
        matched_classes = root.xpath(f'//{id}')
        if id not in conf:
            continue
        elif not conf[id]:
            print(f"There's no expands defined for {id}")
            continue
        if matched_classes is None:
            print("No matched classes")
            continue
        for matched_class in matched_classes:
            for source in conf[id].keys():
                lis = matched_class.xpath(f'.//li[starts-with(string(.), "{source}")]')
                for li in lis:
                    for addition in conf[id][source][0]:
                        li_parent = li.getparent()
                        new_li = ET.Element("li")
                        new_li.text = re.sub(source, addition, li.text)
                        if not li.getparent().xpath(f'.//li[text()="{new_li.text}"]'):
                            li_parent.append(new_li)
                    if len(conf[id][source]) > 1 and conf[id][source][1]:
                        li.getparent().remove(li)
# Crowdin can't tell apart all the <li> elements, it only sees a bunch of same elements in an order
# So we use append the new elements to the list to not mess up the order of existing elements
# addnext would probably cause a lot of problems
# append should only cause problems when an update to the file already does



def process(input: Path, output: Path):
    tree = ET.parse(input, ET.XMLParser(remove_blank_text=True))
    root = tree.getroot()
    if input.name in conf:
        for source, additions in conf[input.name]["expands"].items():
            expand(
                root, 
                additions,
                source,
            )
    
    
    tree.write(output, encoding="utf-8", xml_declaration=True, pretty_print=True)
    format(output, output)

def expand(root, additions: list[str], source: str, replace=False):
    lis = root.xpath(f'.//li[starts-with(string(.), "{source}")]')
    for li in lis:
        for addition in additions:
            new_li = ET.Element("li")
            new_li.text = re.sub(source, addition, li.text)
            if not li.getparent().xpath(f'.//li[text()="{new_li.text}"]'):
                li.addnext(new_li)

def list_lis(root, source):
    lis = root.xpath(f'.//li[starts-with(string(.), "{source}")]')
    for li in lis:
        print(ET.tostring(li, encoding="unicode"))

def format(input: Path, output: Path):
    with open(input, encoding="utf-8") as f:
        text = f.read()
    
    replacements = {
        r"&gt;": ">",
        r"'1.0' encoding='UTF-8'": '"1.0" encoding="UTF-8"',
        #r"&lt;/rulesStrings": "</rulesStrings",
        #r"&lt;rulesStrings": "<rulesStrings",
    }

    for pattern, repl in replacements.items():
        #print(f"Replacing {pattern:<20} with {repl}")
        text = re.sub(pattern, repl, text, flags=re.MULTILINE)

    with open(output, "w", encoding="utf-8") as f:
        f.write(text)


if __name__ == "__main__":
    main()
