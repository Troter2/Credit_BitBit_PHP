var contentMap = document.getElementById('contentMap');
var contentForm = document.getElementById('contentForm');

function switchVisible() {
    if (contentMap.hidden == false) {
        contentMap.hidden = true;
        contentForm.hidden = false;
        document.getElementById("changeInfoButton").innerHTML = "Show location map";
    } else {
        contentMap.hidden = false;
        contentForm.hidden = true;
        document.getElementById("changeInfoButton").innerHTML = "Show contact form";
    }
}