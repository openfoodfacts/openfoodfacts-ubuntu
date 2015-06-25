function load() {

listModel.clear();
var xhr = new XMLHttpRequest();
xhr.open("GET","http://fr.openfoodfacts.org/api/v0/produit/" + pageProductView.barcode,true);
xhr.onreadystatechange = function()
{
if ( xhr.readyState == xhr.DONE)
{
if ( xhr.status == 200)
{
var jsonObject = eval('(' + xhr.responseText + ')');
loaded(jsonObject)
}
}
}
xhr.send();
}

function loaded(jsonObject)
{
  jsonData = jsonObject;
}
