# Qt Creator Font Awesome Basics
_This tutorial describes the basic approach for using Font Awesome's icons in Qt Creator. The example code is a simplified version of [Esri's ArcGIS AppStudio](https://doc.arcgis.com/en/appstudio/) Font Awesome sample._ 

## What is Font Awesome?
Font Awesome is a set of standardized vector icons for use in websites and applications. Using these icons in your application can be a simple way to make it look more professional. They are available in a variety of formats, but for this tutorial we will be making use of the font file format.

![Screenshot of the example app](/tutorial-assets/AppScreenshot.png)

## Getting Started
- After you have created a new app, browse to the [Font Awesome](https://fontawesome.com/ "Font Awesome") website and download Font Awesome.
  - _**Tip:** Browse around the website some to see what's available and which font set(s) have the icons you want to use._
- Unzip the file. There will be several folders and files inside.
- Browse to "web-fonts-with-css/webfonts/" folder.
- Copy the True Type Font (.ttf) file(s) for the font set(s) you want to use into your application's 'asset' folder (you may need more thn one).
- Open your application's qml in Qt Creator
- Load the font(s) into your app's content area using the ```FontLoader{}``` class:
```qml
//line 56 from example qml
FontLoader {
    id: faBrands
    source: "assets/fa-brands-400.ttf" //"Brands" icon set
}

FontLoader {
    id: faSolid
    source: "assets/fa-solid-900.ttf" //"Solid" icon set
}
```

## Using an Icon from the Font File

![Screenshot of the example app with usages labeled](/tutorial-assets/AppScreenshotLabels.png)

- Before beginning, you'll need the character code for the icon(s) you want to use.
- A simple way to get this code is to [browse to the icon](https://fontawesome.com/icons?d=gallery) on the Font Awesome website.
- The code will appear towards the upper left of the page, underneath the character name.
![Where to locate the characer code](/tutorial-assets/CharacterCode.png)

### Single Icon
- Use a ```Text{}``` class to load the icon
- The ```font.family``` property will reference the id for the ```FontLoader{}``` class(es) you created above
- The ```text``` property will reference the character code you looked up from the website. Note "\u" is prepended to the string.
- Set the font size as normal using the ```font.pixelSize``` property and a scale factor, if desired.
- Set the color using the ```color``` property.
- Example from qml:
```qml
//line 78 from example qml
Text {
    font.family: faBrands.name //from FontLoader id
    text: "\uf092" //icon character code
    font.pixelSize: 35 *scaleFactor //icon character size
    color: "black" //icon character color
}
```
### Icon with Label
- To setup a label for the icon, use an additional ```Text{}``` class
- Use anchors to place the label in relation to the icon
  - _**Tip:** use the ```qsTr()``` function to mark a string for localization translation._
- Example from qml:
```qml
//line 94 from example qml
//icon (same setup as for single icon)
Text {
    id: homeIcon
    font.family: faSolid.name
    text: "\uf015"
    font.pixelSize: 35 * scaleFactor
    color: iconColor
}

//icon label
Text {
    anchors.verticalCenter: parent.verticalCenter
    anchors.left: homeIcon.right
    anchors.leftMargin: 8 *scaleFactor
    text: qsTr("Home") //the 'qsTr()' function marks a string for localization translation
    font.pixelSize: 15 * scaleFactor
    color: iconColor
}
```

### Button with Icon (and Label)
- The icons can be used for buttons as well.
- Use the same format as above, but nest it within a ```Button{}``` class.
- Exmple:
```qml
//line 122 from example qml
Button {
    Layout.preferredWidth: 100 * scaleFactor
    Layout.preferredHeight: 50 * scaleFactor
    Layout.alignment: Qt.AlignHCenter

    //icon
    Text{
        id: emailIcon
        anchors.left: parent.left
        anchors.leftMargin: 15 * scaleFactor
        anchors.verticalCenter: parent.verticalCenter
        font.family: faSolid.name
        text: "\uf0e0"
        font.pixelSize: 20 *scaleFactor
        color: "green"
    }

    //label
    Text {
        anchors.left: emailIcon.right
        anchors.leftMargin: 13 * scaleFactor
        anchors.verticalCenter: parent.verticalCenter
        text:qsTr("Email")
        font.pixelSize: 15 * scaleFactor
        color:"#888"
    }
```
