function install(aData, aReason) {}
function startup(aData, aReason) {
  const { classes: Cc, interfaces: Ci, utils: Cu } = Components;
  const { Services } = Cu.import('resource://gre/modules/Services.jsm', {});
  const applicationChrome = Services.dirsvc.get('AChrom', Ci.nsIFile);
  if (!applicationChrome.isDirectory())
    return;

  const files = aChromeDirectory.directoryEntries;
  while (files.hasMoreElements()) {
    const file = files.getNext().QueryInterface(Ci.nsIFile);
    if (!file.isFile() || !/\.js$/i.test(file.leafName))
      continue;
    Cc['@mozilla.org/moz/jssubscript-loader;1']
      .getService(Ci.mozIJSSubScriptLoader)
      .loadSubScript(Services.ios.newFileURI(file).spec, {});
  }
}
function shutdown(aData, aReason) {}
function uninstall(aData, aReason) {}

