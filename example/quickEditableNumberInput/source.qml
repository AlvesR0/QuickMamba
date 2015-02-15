import QtQuick 2.0
import "../../qml/QuickMamba"
import QtQuick.Controls 1.1

Rectangle
{
    id: root
    color: "black"
    width: 300
    height: 250

    property string linkedText: "42.42"

    FocusHandler {

    }

    QuickEditableNumberInput {
        id: numberInput
        width: 150
        height: 50
        anchors.centerIn: parent

        minValue: -25
        maxValue: 50
        decimals: 3
        defaultIncrement: 0.5

        // Access to all properties of a classic qml textInput by textInput.<textIntproperty>
        textInput.text: root.linkedText

        // Must use this signal to unbreak text link
        onQuickUpdate: root.linkedText = quickValue

        onEditingFinished: {
            //User pressed enter or input focus was lost
            root.linkedText = textInput.text
        }
    }

    // Example how to add a new behaviour from external
    Rectangle {
        color: "#212121"
        width:parent.width
        height:50

        Text {
            anchors.fill: parent
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter

            color: "white"
            text: "Increment first number"
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {
                numberInput.textInput.cursorPosition = 0
                numberInput.updateValue(1)
            }
        }
    }    
}
