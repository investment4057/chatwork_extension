// Docs: https://developer.chrome.com/docs/extensions/reference/tabs/#get-the-current-tab
async function getUrl() {
  let queryOptions = { active: true, lastFocusedWindow: true };
  let [tab] = await chrome.tabs.query(queryOptions);
  return tab.url;
}
