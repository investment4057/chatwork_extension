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
  chrome.storage.local.get([
    'MYID',
    'ACCESS_TOKEN',
    'CLIENT_VER'
  ]).then((result) => {
    console.log('Value currently is ' + result.MYID);
    console.log('Value currently is ' + result.ACCESS_TOKEN);
    console.log('Value currently is ' + result.CLIENT_VER);
  });

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

// MYIDを`chrome.storage`から取り出す処理
function dataGetStrageMyidFunc() {
  return new Promise((resolve, reject) => {
    chrome.storage.local.get(['MYID'], (value) => {
      resolve(value.MYID);
    });
  });
}

async function dataGetStrageMyid() {
  var myId = "";

  const tab = await getCurrentTab();

  await new Promise((resolve, reject) => {
    chrome.scripting.executeScript({
      target: { tabId: tab.id },
      func: dataGetStrageMyidFunc,
    },
    (result) => {
      myId = result[0].result;
      resolve();
    });
  });

  return myId;
}

// ACCESS_TOKENを`chrome.storage`から取り出す処理
function dataGetStrageAccessTokenFunc() {
  return new Promise((resolve, reject) => {
    chrome.storage.local.get(['ACCESS_TOKEN'], (value) => {
      resolve(value.ACCESS_TOKEN);
    });
  });
}

async function dataGetStrageAccessToken() {
  var accessToken = "";

  const tab = await getCurrentTab();

  await new Promise((resolve, reject) => {
    chrome.scripting.executeScript({
      target: { tabId: tab.id },
      func: dataGetStrageAccessTokenFunc,
    },
    (result) => {
      accessToken = result[0].result;
      resolve();
    });
  });

  return accessToken;
}

// CLIENT_VERを`chrome.storage`から取り出す処理
function dataGetStrageClientVerFunc() {
  return new Promise((resolve, reject) => {
    chrome.storage.local.get(['CLIENT_VER'], (value) => {
      resolve(value.CLIENT_VER);
    });
  });
}

async function dataGetStrageClientVer() {
  var clientVer = "";

  const tab = await getCurrentTab();

  await new Promise((resolve, reject) => {
    chrome.scripting.executeScript({
      target: { tabId: tab.id },
      func: dataGetStrageClientVerFunc,
    },
    (result) => {
      clientVer = result[0].result;
      resolve();
    });
  });

  return clientVer;
}
