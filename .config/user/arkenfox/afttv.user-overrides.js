// afttv version 122

// 0403: Overriden as per wiki's "override if you do not understand the consequences"
// user_pref("browser.safebrowsing.downloads.remote.enabled", true);

// 2811: keep history
// user_pref("privacy.clearOnShutdown.history", false);   // [DEFAULT: true]

// 1201: Consider disabling unsafe negotiation
// user_pref("security.ssl.require_safe_negotiation", false);

// 1212: on failing to reach a CA for cert validation, af cuts the connection
// user_pref("security.OCSP.require", false);

// 2651: disable user interaction enforcement on download 
// user_pref("browser.download.useDownloadDir", true);

user_pref("privacy.resistFingerprinting", true);
user_pref("privacy.resistFingerprinting.letterboxing", true); // optional
user_pref("webgl.disabled", true); // optional

// Spoof language to en-US even when OS language is diff, as per thorin
user_pref("privacy.spoof_english", 2);
