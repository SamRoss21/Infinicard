// Takes in basic XML file and produces the appropriate html elements for UI.html.
// At this stage the XML must be pasted in


$(document).ready(function () {
    var xml = `<root>
    <bar id="bar1">
      <group id="group1">
        <img id="img1">
          <ref>Susan-B-Anthony.jpeg</ref>
        </img>
        <menu_item id="item1">
          <label>Susan B. Anthony</label>
        </menu_item>
      </group>
      <group id="group2">
        <menu_item id="item2">
          <label>About Me</label>
        </menu_item>
        <menu_item id="item3">
          <label>Projects</label>
        </menu_item>
        <menu_item id="item4">
          <label>Contact</label>
        </menu_item>
      </group>
    </bar>
    <card id="card1">
      <group id="group3">
        <img id="img2">
          <ref>Susan-B-Anthony.jpeg</ref>
        </img>
        <title id="title1">
          <label>Susan&amp;apos;s Home Page</label>
        </title>
      </group>
      <group id="group4">
        <title id="title2">
          <label>Bio</label>
        </title>
        <text id="text1">
          <label>Lorem ipsum dolor sit amet</label>
        </text>
      </group>
    </card>
    <card id="card2">
      <group id="group5">
        <title id="title3">
          <label>Contact</label>
        </title>
        <text id="text2">
          <label>Email: Susan@Anthony.com</label>
        </text>
      </group>
    </card>
    <interactions id="interactions">
      <interaction source="item1" target="#card1"/>
      <interaction source="item2" target="#card1"/>
      <interaction source="item3" target="https://github.com/"/>
      <interaction source="item4" target="#card2"/>
    </interactions>
  </root>`

    var parser = new DOMParser();
    var xmlUI = parser.parseFromString(xml,'text/xml')
    var UI = xmlUI.getElementsByTagName("root")[0]

    build_UI(UI)
  });


// go through each highest order group and create children
function build_UI(UI){
    var elements = UI.children;

    for (var element of elements) {
        var id = element.id
        var type = element.tagName

        create(type, id, element)


    }
}

// takes in an element's type (the XML tag), its unique id (a descriptor in the XML), and the XML DOM 
// element and calls the funciton for creating the appropriate html for the element type
function create(type, id, UI_obj, parent_id=null){
    if(type == 'bar'){
        create_bar(id, UI_obj, parent_id)
    } else if (type == 'card'){
        create_card(id, UI_obj, parent_id)
    } else if(type == 'menu_item'){
        create_menu_item(id, UI_obj, parent_id)
    } else if(type == 'group'){
        create_group(id, UI_obj, parent_id)
    } else if(type == 'img'){
        create_image(id, UI_obj, parent_id)
    } else if(type == 'title'){
        create_title(id, UI_obj, parent_id)
    } else if(type == 'text'){
        create_text(id, UI_obj, parent_id)
    } else if(type == 'interactions'){
        create_interactions(UI_obj)
    }

}

function create_bar(id, UI_obj, parent_id=null){
    //create bar
    var nav = document.createElement("div")
    nav.setAttribute('id', id)
    nav.setAttribute('class', 'navbar')

    //if card belongs to another parent group, append it
    if(parent_id){
        var parent = document.getElementById(parent_id)
        parent.appendChild(nav)
    } else{ //otherwise append to html body
        document.body.appendChild(nav)
    }

    //create any sub-groups within bar
    var children = UI_obj.children
    if(children){
        for (var child of children){
            var child_id = child.id
            var type = child.tagName

            create(type, child_id, child, id)
        }
    }
    
}

function create_card(id, UI_obj, parent_id=null){
    //create card
    var card = document.createElement("div")
    card.setAttribute('id', id)
    card.setAttribute('class', 'card')

    //if card belongs to another parent group, append it
    if(parent_id){
        var parent = document.getElementById(parent_id)
        parent.appendChild(card)
    } else{ //otherwise append to html body
        document.body.appendChild(card)
    }

    //create any sub-groups within card
    var children = UI_obj.children
    if(children){
        for (var child of children){
            var child_id = child.id
            var type = child.tagName

            create(type, child_id, child, id)
        }
    }
}


function create_group(id, UI_obj, parent_id=null){
    // create group
    var group = document.createElement("div")
    group.setAttribute('id', id)
    group.setAttribute('class', 'group')


    //if card belongs to another parent group, append it
    if(parent_id){
        var parent = document.getElementById(parent_id)
        parent.appendChild(group)
    } else{ //otherwise append to html body
        document.body.appendChild(group)
    }

    //create any sub-groups within group
    var children = UI_obj.children
    if(children){
        for (var child of children){
            var child_id = child.id
            var type = child.tagName

            create(type, child_id, child, id)
        }
    }
}

function create_menu_item(id, UI_obj, parent_id=null){
    //create menu item
    var menu_item = document.createElement('a')
    menu_item.setAttribute('id', id)
    menu_item.setAttribute('class', "menu_item")
    menu_item.setAttribute('href', '#') //temporary link
    menu_item.innerHTML = UI_obj.getElementsByTagName("label")[0].childNodes[0].textContent;

    //if menu_item belongs to another parent group, append it
    if(parent_id){
        var parent = document.getElementById(parent_id)
        parent.appendChild(menu_item)
    } else{ //otherwise append to html body
        document.body.appendChild(menu_item)
    }

}

function create_image(id, UI_obj, parent_id=null){
    //create image
    var image = document.createElement('img')
    image.setAttribute('id', id)
    image.setAttribute('src', UI_obj.getElementsByTagName("ref")[0].childNodes[0].textContent)


    //if menu_item belongs to another parent group, append it
    if(parent_id){
        var parent = document.getElementById(parent_id)
        parent.appendChild(image)
    } else{ //otherwise append to html body
        document.body.appendChild(image)
    }

}

function create_title(id, UI_obj, parent_id=null){
    //create title
    var title = document.createElement('h1')
    title.setAttribute('id', id)
    title.setAttribute('class', 'title')
    title.innerHTML = UI_obj.getElementsByTagName("label")[0].childNodes[0].nodeValue;

    //if menu_item belongs to another parent group, append it
    if(parent_id){
        var parent = document.getElementById(parent_id)
        parent.appendChild(title)
    } else{ //otherwise append to html body
        document.body.appendChild(title)
    }

}

function create_text(id, UI_obj, parent_id=null){
    //create text
    var text = document.createElement('p')
    text.setAttribute('id', id)
    text.setAttribute('class', 'text')
    text.innerHTML = UI_obj.getElementsByTagName("label")[0].childNodes[0].nodeValue;


    //if menu_item belongs to another parent group, append it
    if(parent_id){
        var parent = document.getElementById(parent_id)
        parent.appendChild(text)
    } else{ //otherwise append to html body
        document.body.appendChild(text)
    }

}

//apply the interaction links to the existing UI elements using the interactions source/target pairs
function create_interactions(UI_obj){
    var children = UI_obj.children

    if(children){
        for (var child of children){
            var source = child.getAttribute("source")
            var target = child.getAttribute("target")
            source_item = document.getElementById(source)
            source_item.setAttribute('href', target)
        }
    }
    
}