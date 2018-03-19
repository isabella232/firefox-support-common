const { classes: Cc, interfaces: Ci, utils: Cu } = Components;
const { Services } = Cu.import('resource://gre/modules/Services.jsm', {});

function loadScripts() {
  const log = (aMessage, ...aArgs) => {
    Services.console.logStringMessage(`${aMessage} ${JSON.stringify(aArgs)}`);
  };
  log('Startup');

  const applicationChrome = Services.dirsvc.get('AChrom', Ci.nsIFile);
  log(`Scanning ${applicationChrome.path}...`);
  if (!applicationChrome.isDirectory()) {
    log('No script file found.');
    return;
  }

  const Prefs = Services.prefs;
  const DefaultPrefs = Services.prefs.getDefaultBranch(null);
  const setPref = (aBranch, aKey, aValue) => {
    switch (typeof aValue) {
      case 'string':
        return aBranch.setCharPref(aKey, unescape(encodeURIComponent(aValue)));
      case 'number':
        return aBranch.setIntPref(aKey, parseInt(aValue));
      default:
        return aBranch.setBoolPref(aKey, !!aValue);
    }
  };

  const namespace = {
    getPref(aKey) {
      const type = Prefs.getPrefType(aKey);
      if (type == Prefs.PREF_INVALID)

        return null;
      try {
        switch (type) {
          case Prefs.PREF_STRING:
            return decodeURIComponent(escape(Prefs.getCharPref(aKey)));
          case Prefs.PREF_INT:
            return Prefs.getIntPref(aKey);
          case Prefs.PREF_BOOL:
            return Prefs.getBoolPref(aKey);
          case Prefs.PREF_INVALID:
          default:
            return null;
        }
      } catch(e) {
        // getXXXPref can raise an error if it is the default branch.
        return null;
      }
    },
    lockPref(aKey, aValue) {
      try {
        if (DefaultPrefs.prefIsLocked(aKey))
          DefaultPrefs.unlockPref(aKey);
        setPref(DefaultPrefs, aKey, aValue);
        DefaultPrefs.lockPref(aKey);
      }
      catch(e) {
        Cu.reportError(e);
      }
    },
    unlockPref(aKey) {
      try {
        DefaultPrefs.unlockPref(aKey);
      }
      catch(e) {
        Cu.reportError(e);
      }
    },
    defaultPref(aKey, aValue) {
      setPref(DefaultPrefs, aKey, aValue);
    },
    pref(aKey, aValue) {
      setPref(Prefs, aKey, aValue);
    },
    clearPref(aKey) {
      if (Prefs.prefHasUserValue(aKey))
        Prefs.clearUserPref(aKey);
    },
    getenv(aName) {
      try {
        return Cc['@mozilla.org/process/environment;1'].getService(Ci.nsIEnvironment).get(aName);
      }
      catch(e) {
        Cu.reportError(e);
      }
      return undefined;
    }
  };

  const files = applicationChrome.directoryEntries;
  while (files.hasMoreElements()) {
    const file = files.getNext().QueryInterface(Ci.nsIFile);
    log(`Checking ${file.path}...`);
    if (!file.isFile() || !/\.js$/i.test(file.leafName))
      continue;
    log(`Loading ${file.path}...`);
    Cc['@mozilla.org/moz/jssubscript-loader;1']
      .getService(Ci.mozIJSSubScriptLoader)
      .loadSubScript(Services.io.newFileURI(file).spec, namespace);
  }
  log('Done.');
}

function install(aData, aReason) {}
function startup(aData, aReason) {
  if (Services.startup.startingUp)
    Services.obs.addObserver({
      observe() {
        Services.obs.removeObserver(this, 'sessionstore-windows-restored');
        loadScripts();
      }
    }, 'sessionstore-windows-restored', false);
  else
    loadScripts();
}
function shutdown(aData, aReason) {}
function uninstall(aData, aReason) {}

