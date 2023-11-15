#Python to create basic example XML UI file

from lxml import etree

root = etree.Element("root")

#top level elements
bar1 = etree.SubElement(root, "bar", id="bar1")
card1 = etree.SubElement(root, "card", id="card1")
card2 = etree.SubElement(root, "card", id="card2")
interactions = etree.SubElement(root, "interactions", id="interactions")

#bar sub elements
group1 = etree.SubElement(bar1, "group", id="group1")
group2 = etree.SubElement(bar1, "group", id="group2")

img1 = etree.SubElement(group1, "img", id="img1")
img1_ref = etree.SubElement(img1, "ref")
img1_ref.text = "Susan-B-Anthony.jpeg"

item1 = etree.SubElement(group1, "menu_item", id="item1")
item1_label = etree.SubElement(item1, "label")
item1_label.text = "Susan B. Anthony"

item2 = etree.SubElement(group2, "menu_item", id="item2")
item2_label = etree.SubElement(item2, "label")
item2_label.text = "About Me"

item3 = etree.SubElement(group2, "menu_item", id="item3")
item3_label = etree.SubElement(item3, "label")
item3_label.text = "Projects"

item4 = etree.SubElement(group2, "menu_item", id="item4")
item4_label = etree.SubElement(item4, "label")
item4_label.text = "Contact"


#card1 sub elements
group3 = etree.SubElement(card1, "group", id="group3")
group4 = etree.SubElement(card1, "group", id="group4")

img2 = etree.SubElement(group3, "img", id="img2")
img2_ref = etree.SubElement(img2, "ref")
img2_ref.text = "Susan-B-Anthony.jpeg"

title1 = etree.SubElement(group3, "title", id="title1")
title1_label = etree.SubElement(title1, "label")
title1_label.text = "Susan&apos;s Home Page"

title2 = etree.SubElement(group4, "title", id="title2")
title2_label = etree.SubElement(title2, "label")
title2_label.text = "Bio"

text1 = etree.SubElement(group4, "text", id="text1")
text1_label = etree.SubElement(text1, "label")
text1_label.text = "Lorem ipsum dolor sit amet"

#card2 sub elements
group5 = etree.SubElement(card2, "group", id="group5")

title3 = etree.SubElement(group5, "title", id="title3")
title3_label = etree.SubElement(title3, "label")
title3_label.text = "Contact"

text2 = etree.SubElement(group5, "text", id="text2")
text2_label = etree.SubElement(text2, "label")
text2_label.text = "Email: Susan@Anthony.com"

#interactions
int1 = etree.SubElement(interactions, "interaction", source="item1", target="#card1")
int2 = etree.SubElement(interactions, "interaction", source="item2", target="#card1")
int3 = etree.SubElement(interactions, "interaction", source="item3", target="https://github.com/")
int4 = etree.SubElement(interactions, "interaction", source="item4", target="#card2")

with open('UI.xml', 'w') as fp:
    fp.write(etree.tostring(root, encoding='unicode', pretty_print=True))