{
"translatorID":"37865636-a6e8-11ed-afa1-0242ac120002",
"translatorType":2,
"label":"Markdown Item",
"creator":"afaikiac, chatgpt",
"target":"markdown",
"minVersion":"2.0",
"maxVersion":"",
"priority":200,
"inRepository":false,
"lastUpdated":"2023-02-07"
}

function doExport() {
  var item;
  while (item = Zotero.nextItem()) {
    var author = item.creators && item.creators[0] ? item.creators[0].lastName : '';
    var title = item.title;
    // var year = item.date;
		var year = item.date ? new Date(item.date).getFullYear() : '';
    
    var markdown = '';
    if (author && year) {
      markdown = '[' + author + ', ' + year + ']';
    } else if (author) {
      markdown = '[' + author + ']';
    } else if (title) {
      markdown = '[' + title + ']';
    }
    
    if (markdown) {
      Zotero.write('(' + markdown + '(zotero://select/library/items/' + item.key + '))');
    } else Zotero.write("Unexpected metadata")
  }
}
