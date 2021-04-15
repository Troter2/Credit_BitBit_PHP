var contentMap = document.getElementById('contentMap'),
contentForm = document.getElementById('contentForm');

function switchVisible() {
  if(!contentMap) return;
  if (getComputedStyle(contentMap).display == 'block') {
    contentMap.style.display = 'none';
    contentForm.style.display = 'block';
    document.getElementById("changeInfoButton").innerHTML ="Show location map";
  } else {
    contentMap.style.display = 'block';
    contentForm.style.display = 'none';
    document.getElementById("changeInfoButton").innerHTML="Show contact form";
  }
}
document.getElementById('Button1').addEventListener('click', switchVisible);