async function getCurrentTab() {
  let queryOptions = { active: true, lastFocusedWindow: true };
  let [tab] = await chrome.tabs.query(queryOptions);
  return tab;
}

async function allOpenedChat(myId, accessToken, clientVer) {
  const tab = await getCurrentTab();

  await chrome.scripting.executeScript({
    target: { tabId: tab.id },
    func: openedItem,
    args: [myId, accessToken, clientVer]
  });
}

function openedItem(myId, accessToken, clientVer) {
  // let selectElements = document.querySelectorAll("#RoomList ul li[role=listitem]");
  // var d=new Date();
  // var rid;

  // selectElements.forEach(function(element, index) {
  //   rid = element.dataset.rid;

  //   getRead = element.querySelector('li'); // 未読チャット確認のセレクタ
  //   if (getRead) {
  //     if (!getRead.hasAttribute('data-testid')) { // TOがなければ既読する
  //       $.getJSON('https://'+window.location.hostname+'/gateway.php?cmd=read&myid='+MYID+'&_v='+CLIENT_VER+'&_av=5&_t='+ACCESS_TOKEN+'&ln=ja&room_id='+rid+'&last_chhkkt_id='+$('._message[data-rid='+rid+']:last  ').data('mid')+'&_='+d.getDate());
  //     }
  //   }
  // });
}

async function dataKeepStrage(myId, accessToken, clientVer) {
  const tab = await getCurrentTab();

  await chrome.scripting.executeScript({
    target: { tabId: tab.id },
    func: keepStrage,
    args: [myId, accessToken, clientVer]
  });
}

function keepStrage(myId, accessToken, clientVer) {

  window.alert('chrome.storageで保存・取得します!');

  chrome.storage.local.set({
    'MYID': myId,
    'ACCESS_TOKEN': accessToken,
    'CLIENT_VER': clientVer
  }).then(() => {
    console.log('Value is set to ' + myId);
    console.log('Value is set to ' + accessToken);
    console.log('Value is set to ' + clientVer);
  });

  chrome.storage.local.get([
    'MYID',
    'ACCESS_TOKEN',
    'CLIENT_VER'
  ]).then((result) => {
    console.log('Value currently is ' + result.MYID);
    console.log('Value currently is ' + result.ACCESS_TOKEN);
    console.log('Value currently is ' + result.CLIENT_VER);
  });
}
