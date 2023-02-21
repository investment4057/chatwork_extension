async function getCurrentTab() {
  let queryOptions = { active: true, lastFocusedWindow: true };
  let [tab] = await chrome.tabs.query(queryOptions);
  return tab;
}

async function allOpenedChat() {
  const tab = await getCurrentTab();

  await chrome.scripting.executeScript({
    target: { tabId: tab.id },
    func: openedItem
  });
}

function openedItem() {
  let selectElements = document.querySelectorAll("#RoomList ul li[role=listitem]");
  var d=new Date();
  var rid;

  selectElements.forEach(function(element, index) {
    rid = element.dataset.rid;

    getRead = element.querySelector('li'); // 未読チャット確認のセレクタ
    if (getRead) {
      if (!getRead.hasAttribute('data-testid')) { // TOがなければ既読する
        $.getJSON('https://'+window.location.hostname+'/gateway.php?cmd=read&myid='+MYID+'&_v='+CLIENT_VER+'&_av=5&_t='+ACCESS_TOKEN+'&ln=ja&room_id='+rid+'&last_chhkkt_id='+$('._message[data-rid='+rid+']:last  ').data('mid')+'&_='+d.getDate());
      }
    }
  });
}
