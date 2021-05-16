function switchVisible() {
    let contentMap = document.getElementById('contentMap');
    let contentForm = document.getElementById('contentForm');
    if (contentMap.hidden == false) {
        contentMap.hidden = true;
        contentForm.hidden = false;
        document.getElementById("changeInfoButton").innerHTML = "On ens pots trovar?";
    } else {
        contentMap.hidden = false;
        contentForm.hidden = true;
        document.getElementById("changeInfoButton").innerHTML = "Formulari de contacte";
    }
}