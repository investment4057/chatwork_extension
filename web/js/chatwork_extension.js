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
  let selectElements = document.querySelectorAll("#RoomList ul li[role=listitem]");
  var d=new Date();
  var rid;

  selectElements.forEach(function(element, index) {
    rid = element.dataset.rid;

    getRead = element.querySelector('li'); // 未読チャット確認のセレクタ
    if (getRead) {
      if (!getRead.hasAttribute('data-testid')) { // TOがなければ既読する
        $.getJSON('https://'+window.location.hostname+'/gateway.php?cmd=read&myid='+myId+'&_v='+clientVer+'&_av=5&_t='+accessToken+'&ln=ja&room_id='+rid+'&last_chhkkt_id='+$('._message[data-rid='+rid+']:last  ').data('mid')+'&_='+d.getDate());
      }
    }
  });
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
  chrome.storage.local.set({
    'MYID': myId,
    'ACCESS_TOKEN': accessToken,
    'CLIENT_VER': clientVer
  });
}

// Chrome Storageから指定されたキーの値を取得する処理
function dataGetStrageValueFunc(key) {
  return new Promise((resolve, reject) => {
    chrome.storage.local.get([key], (value) => {
      resolve(value[key]);
    });
  });
}

async function dataGetStrageValue(key) {
  var value = "";

  const tab = await getCurrentTab();

  await new Promise((resolve, reject) => {
    chrome.scripting.executeScript({
      target: { tabId: tab.id },
      func: dataGetStrageValueFunc,
      args: [key]
    },
    (result) => {
      value = result[0].result;
      resolve();
    });
  });

  return value;
}

// MYIDを`chrome.storage`から取り出す処理
async function dataGetStrageMyid() {
  return await dataGetStrageValue('MYID');
}

// ACCESS_TOKENを`chrome.storage`から取り出す処理
async function dataGetStrageAccessToken() {
  return await dataGetStrageValue('ACCESS_TOKEN');
}

// CLIENT_VERを`chrome.storage`から取り出す処理
async function dataGetStrageClientVer() {
  return await dataGetStrageValue('CLIENT_VER');
}

// タグの生成
var _chatText = $('#_chatText');
_chatText.on('keypress', function(e) {
  // ex) `:info` + Enter
  ['info', 'title', 'code'].forEach(function(tag) {
    var regTagMatch = new RegExp("(^|\n):" + tag +"($|\n)");
    var regTagReplace = new RegExp(":" + tag);

    if (_chatText.val().match(regTagMatch)) {
      var makeInfoTag = function() {
        var val = _chatText.val();
        _chatText.val(val.replace(regTagReplace, "[" + tag + "]\n[/" + tag + "]"));
      };
      makeInfoTag();
    }
  });
});
