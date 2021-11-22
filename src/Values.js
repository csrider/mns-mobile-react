export const appName = "MNS Connections Mobile"

export const config = {
    enableMainMenu: false,
    enableSectionMenu: false,
}

export const menuTypes = {
  mainApp: "mainApp",
  messageSection: "messageSection",
  messageItem: "messageItem",
};


//=========================================================
// The following is dummy data for demonstrating front-end.
// In reality, this would pull from the Connections server.

export const sections = [
  { key: 0, name: "My Favorites" },
  { key: 1, name: "Emergency" },
];

export const messages = [
  { key: 0, name: "Msg 1", sectionKey: 1, icon: "FcAlarmClock", msg: "This is a test message #1." },
  { key: 1, name: "Msg 2", sectionKey: 0, icon: "FcFlashOn", msg: "This is a test message #2." },
  { key: 2, name: "Msg 3", sectionKey: 0, icon: "FcHighPriority", msg: "This is a test message #3." },
  { key: 3, name: "Msg 4", sectionKey: 1, icon: "FcOk", msg: "This is a test message #4." },
  { key: 4, name: "Msg 5", sectionKey: 0, icon: "FcSpeaker", msg: "This is a test message #5." },
];
